import 'package:flutter/material.dart';
import 'package:recipe_app/screens/donation_screen.dart';
import 'screens/home_screen.dart';
import 'screens/donation_history_screen.dart';
import 'screens/profile_screen.dart';
import 'models/donation_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Donasi',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: NavigationScreen(),
    );
  }
}

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _currentIndex = 0;
  List<Donation> _donationHistory = [];
  Map<String, int> _totalDonationsPerPlace = {};

  final List<Widget> _screens = [];

  @override
  void initState() {
    super.initState();
    _screens.addAll([
      HomeScreen(onDonate: _navigateToDonation),
      DonationHistoryScreen(donationHistory: _donationHistory),
      ProfileScreen(donationHistory: _donationHistory, totalDonationsPerPlace: {},),
    ]);
  }

  void _navigateToDonation(Map<String, String> donationDetails) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DonationScreen(receiver: donationDetails['receiver']!),
      ),
    );

    if (result is Map<String, dynamic> && result['success'] == true) {
      final place = donationDetails['receiver']!;
      final amount = result['amount'] as int;

      setState(() {
        _donationHistory.add(Donation(
          receiver: place,
          amount: amount,
          method: result['method'],
          date: DateTime.now().toString().substring(0, 10),
        ));

        _totalDonationsPerPlace[place] =
            (_totalDonationsPerPlace[place] ?? 0) + amount;
      });
    }
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Riwayat'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Bio'),
        ],
      ),
    );
  }
}
