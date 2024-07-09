// transaction_history.dart
class TransactionHistory {
  final String totalHarga;
  final String diskon; // Now stores percentage as a string
  final String totalBayar;
  final DateTime waktu;

  TransactionHistory({
    required this.totalHarga,
    required this.diskon,
    required this.totalBayar,
    required this.waktu,
  });
}
