// transaction_provider.dart
import 'package:flutter/material.dart';
import 'transaction_history_screen.dart';

class TransactionProvider with ChangeNotifier {
  List<TransactionHistory> _transactions = [];

  List<TransactionHistory> get transactions => _transactions;

  void addTransaction(TransactionHistory transaction) {
    _transactions.add(transaction);
    notifyListeners();
  }
}
