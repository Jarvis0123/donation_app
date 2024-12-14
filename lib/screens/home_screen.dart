import 'package:flutter/material.dart';
import '../widgets/donation_card.dart';

class HomeScreen extends StatelessWidget {
  final Function(Map<String, String>) onDonate;

  HomeScreen({required this.onDonate});

  final List<Map<String, String>> donationPlaces = [
    {'name': 'Yayasan Pendidikan', 'description': 'Dukung pendidikan.', 'image': 'assets/images/place1.png'},
    {'name': 'Rumah Sakit', 'description': 'Bantu pengobatan pasien.', 'image': 'assets/images/place2.png'},
    {'name': 'BPBD', 'description': 'Penanggulangan bencana.', 'image': 'assets/images/place3.png'},
    {'name': 'Panti Asuhan', 'description': 'Bantu anak yatim.', 'image': 'assets/images/place4.png'},
    {'name': 'Lembaga Sosial', 'description': 'Bantuan sosial umum.', 'image': 'assets/images/place5.png'},
    {'name': 'Pendidikan Digital', 'description': 'Dukung pembelajaran online.', 'image': 'assets/images/place6.png'},
    {'name': 'Penanggulangan Kemiskinan', 'description': 'Bantuan tunai langsung.', 'image': 'assets/images/place7.png'},
    {'name': 'Kesehatan Ibu dan Anak', 'description': 'Bantu kesehatan.', 'image': 'assets/images/place8.png'},
    {'name': 'Pemberdayaan UMKM', 'description': 'Modal usaha kecil.', 'image': 'assets/images/place9.png'},
    {'name': 'Pembangunan Masjid', 'description': 'Dukung pembangunan masjid.', 'image': 'assets/images/place10.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Beranda')),
      body: ListView.builder(
        itemCount: donationPlaces.length,
        itemBuilder: (context, index) {
          final place = donationPlaces[index];
          return DonationCard(
            title: place['name']!,
            description: place['description']!,
            imageUrl: place['image']!,
            onTap: () => onDonate({'receiver': place['name']!}),
          );
        },
      ),
    );
  }
}
