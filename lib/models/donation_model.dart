// lib/models/donation_model.dart

class Donation {
  final String receiver;
  final int amount;
  final String method;
  final String date;

  Donation({
    required this.receiver,
    required this.amount,
    required this.method,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'receiver': receiver,
      'amount': amount,
      'method': method,
      'date': date,
    };
  }

  factory Donation.fromMap(Map<String, dynamic> map) {
    return Donation(
      receiver: map['receiver'],
      amount: map['amount'],
      method: map['method'],
      date: map['date'],
    );
  }
}
