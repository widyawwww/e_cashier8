import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:cashier8/screens/transaction_provider_screen.dart';
import 'package:cashier8/screens/transaction_history_screen.dart';
import 'profile_screen.dart'; // Import ProfileScreen file
import 'home_screen.dart'; // Import HomeScreen file

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {

  void _navigateToScreen(int index) {
    switch (index) {
      case 0:
        // Handle navigation to Home if needed
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
        break;
      case 1:
        // Handle navigation to CartScreen
        break;
      case 2:
        // Handle navigation to History if needed
        // Do nothing as we're already on HistoryScreen
        break;
      case 3:
        // Handle navigation to Profile if needed
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen()),
        );
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final transactions = Provider.of<TransactionProvider>(context).transactions;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "History",
          style: GoogleFonts.poppins(color: Colors.white),
        ),
        backgroundColor: Color(0xFF415F9D),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return TransactionCard(transaction: transactions[index]);
              },
            ),
          ),
          Container(
            width: double.infinity,
            color: Color(0xFF415F9D),
            padding: EdgeInsets.symmetric(vertical: 16),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Text(
                'Kembali ke Beranda',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TransactionCard extends StatelessWidget {
  final TransactionHistory transaction;

  const TransactionCard({Key? key, required this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tanggal: ${transaction.waktu.day}/${transaction.waktu.month}/${transaction.waktu.year}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            _buildTransactionInfo('Total Harga:', transaction.totalHarga),
            _buildTransactionInfo('Diskon:', '${transaction.diskon}%'), // Display percentage
            _buildTransactionInfo('Total Bayar:', transaction.totalBayar),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionInfo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }
}
