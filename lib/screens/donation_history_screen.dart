import 'package:flutter/material.dart';
import '../models/donation_model.dart';

class DonationHistoryScreen extends StatelessWidget {
  final List<Donation> donationHistory;

  DonationHistoryScreen({required this.donationHistory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Riwayat Donasi')),
      body: donationHistory.isEmpty
          ? Center(
              child: Text(
                'Belum ada riwayat donasi',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: donationHistory.length,
              itemBuilder: (context, index) {
                final history = donationHistory[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: ListTile(
                    title: Text(
                      'Donasi ke ${history.receiver}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tanggal: ${history.date}'),
                        Text('Jumlah: Rp${history.amount.toString()}'),
                        Text('Metode Pembayaran: ${history.method}'),
                      ],
                    ),
                    trailing: Icon(Icons.check_circle, color: Colors.green),
                  ),
                );
              },
            ),
    );
  }
}
