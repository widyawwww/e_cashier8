import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cashier8/screens/history_screen.dart';
import 'package:cashier8/screens/transaction_provider_screen.dart';

// Pastikan import TransactionHistory jika didefinisikan di file terpisah
import 'package:cashier8/screens/transaction_history_screen.dart';

class BayarScreen extends StatefulWidget {
  final String totalHarga;
  final String diskon;
  final String totalBayar;

  const BayarScreen({
    Key? key,
    required this.totalHarga,
    required this.diskon,
    required this.totalBayar,
  }) : super(key: key);

  @override
  State<BayarScreen> createState() => _BayarScreenState();
}

class _BayarScreenState extends State<BayarScreen> {
  Widget _buildRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
        Text(
          value,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bayar",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF415F9D),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                'PEMBAYARAN',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFF233B6E),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    _buildRow('Total Harga:', widget.totalBayar), // Tukar totalHarga dengan totalBayar
                    SizedBox(height: 12),
                    _buildRow('Diskon:', widget.diskon),
                    SizedBox(height: 12),
                    _buildRow('Total Bayar:', widget.totalHarga), // Tukar totalBayar dengan totalHarga
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Create a transaction using widget's data
                  final transaction = TransactionHistory(
                    totalHarga: widget.totalBayar,
                    diskon: widget.diskon,
                    totalBayar: widget.totalHarga,
                    waktu: DateTime.now(),
                  );

                  Provider.of<TransactionProvider>(context, listen: false)
                      .addTransaction(transaction);

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HistoryScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF233B6E), // Background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                    child: Text(
                      'Lihat History',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
