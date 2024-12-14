import 'package:flutter/material.dart';
import '../models/donation_model.dart';

class ProfileScreen extends StatelessWidget {
  final List<Donation> donationHistory;

  ProfileScreen({required this.donationHistory, required Map totalDonationsPerPlace});

  @override
  Widget build(BuildContext context) {
    Map<String, int> totalDonationsPerPlace = {};

    for (var donation in donationHistory) {
      if (totalDonationsPerPlace.containsKey(donation.receiver)) {
        totalDonationsPerPlace[donation.receiver] =
            totalDonationsPerPlace[donation.receiver]! + donation.amount;
      } else {
        totalDonationsPerPlace[donation.receiver] = donation.amount;
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text('Bio Aplikasi')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                width: 120,
                height: 120,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Tentang Aplikasi',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Aplikasi Donasi membantu Anda memberikan donasi dengan mudah dan transparan ke berbagai tujuan seperti pendidikan, kesehatan, dan sosial.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Total Donasi Tiap Tempat',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            totalDonationsPerPlace.isEmpty
                ? Text('Belum ada donasi yang terkumpul.')
                : Column(
                    children: totalDonationsPerPlace.entries.map((entry) {
                      return ListTile(
                        title: Text(entry.key),
                        trailing: Text('Rp${entry.value}'),
                      );
                    }).toList(),
                  ),
          ],
        ),
      ),
    );
  }
}
