import 'package:flutter/material.dart';

class DonationScreen extends StatefulWidget {
  final String receiver;

  DonationScreen({required this.receiver});

  @override
  _DonationScreenState createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  TextEditingController _amountController = TextEditingController();
  String? _selectedMethod;
  int? _selectedAmount;

  final List<int> availableAmounts = [50000, 100000, 200000, 500000, 1000000];
  final List<String> paymentMethods = ['Transfer Bank', 'E-Wallet', 'Kartu Kredit', 'Tunai'];

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  void _submitDonation() {
    final amount = _selectedAmount ?? int.tryParse(_amountController.text) ?? 0;
    if (amount <= 0 || _selectedMethod == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Harap pilih jumlah donasi dan metode pembayaran.')),
      );
      return;
    }

    Navigator.pop(context, {
      'success': true,
      'amount': amount,
      'method': _selectedMethod,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donasi ke ${widget.receiver}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Pilih Nominal Donasi', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            DropdownButton<int>(
              hint: Text('Pilih Jumlah Donasi'),
              value: _selectedAmount,
              onChanged: (int? newValue) {
                setState(() {
                  _selectedAmount = newValue;
                  _amountController.clear();  
                });
              },
              items: availableAmounts.map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text('Rp $value'),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text('Atau Masukkan Jumlah Donasi', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Jumlah Donasi (Rp)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text('Pilih Metode Pembayaran', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            DropdownButton<String>(
              hint: Text('Pilih Metode Pembayaran'),
              value: _selectedMethod,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedMethod = newValue;
                });
              },
              items: paymentMethods.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: _submitDonation,
                child: Text('Kirim Donasi'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
