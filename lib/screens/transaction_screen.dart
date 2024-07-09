import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bayar_screen.dart';

void main() {
  runApp(MaterialApp(
    home: TransactionScreen(),
  ));
}

class TransactionScreen extends StatefulWidget {
  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  List<int> _quantities = [];
  final List<Article> _articles = [
    Article(
      title: "Helm Classic",
      harga: 250000,
      imageUrl: "images/helm2.png",
    ),
    Article(
      title: "Helm Classic",
      harga: 250000,
      imageUrl: "images/helm2.png",
    ),
  ];

  double _diskonPersen = 0; // State untuk persentase diskon

  @override
  void initState() {
    super.initState();
    _quantities = List<int>.filled(_articles.length, 0);
  }

  void _incrementQuantity(int index) {
    setState(() {
      _quantities[index]++;
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      if (_quantities[index] > 0) {
        _quantities[index]--;
      }
    });
  }

  double _calculateTotalHarga() {
    double total = 0;
    for (int i = 0; i < _articles.length; i++) {
      total += _articles[i].harga * _quantities[i];
    }
    return total;
  }

  double _calculateDiskon() {
    double totalHarga = _calculateTotalHarga();
    double diskon = (_diskonPersen / 100) * totalHarga;
    return diskon;
  }

  double _calculateTotalHargaSetelahDiskon() {
    double totalHarga = _calculateTotalHarga();
    double diskon = _calculateDiskon();
    return totalHarga - diskon;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Transaction",
          style: GoogleFonts.poppins(color: Colors.white),
        ),
        backgroundColor: Color(0xFF415F9D),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Agar elemen sejajar
              children: [
              ],
            ),
          ),
          Expanded(
            child: NewsFeedPage2(
              articles: _articles,
              quantities: _quantities,
              incrementQuantity: _incrementQuantity,
              decrementQuantity: _decrementQuantity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // Agar elemen sejajar
                  children: [
                    Text(
                      "Total Harga",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Rp ${_calculateTotalHarga().toStringAsFixed(0)}",
                      style: GoogleFonts.poppins(),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // Agar elemen sejajar
                  children: [
                    Text(
                      "Diskon",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${_diskonPersen.toString()}%", // Menampilkan persentase diskon yang diatur
                      style: GoogleFonts.poppins(),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // Agar elemen sejajar
                  children: [
                    Text(
                      "Total Harga",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      "Rp ${_calculateTotalHargaSetelahDiskon().toStringAsFixed(0)}",
                      style: GoogleFonts.poppins(fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Masukkan Persentase Diskon (%)',
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      _diskonPersen = double.tryParse(value) ?? 0;
                    });
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    print('Navigasi ke BayarScreen');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BayarScreen(
                        totalHarga: _calculateTotalHargaSetelahDiskon().toStringAsFixed(0),
                        diskon: _diskonPersen.toString(),
                        totalBayar: _calculateTotalHarga().toStringAsFixed(0),
                      )),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFF233B6E)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'BAYAR',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Optionally, set text color
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceContainer(String price) {
    return Expanded(
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Color(0xFF233B6E), // Warna biru tua
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            price,
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }

  Widget _buildPlusIconContainer() {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xFF233B6E), // Warna biru tua
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(Icons.add),
        color: Colors.white,
        onPressed: () {
          // Tambahkan aksi sesuai kebutuhan
        },
      ),
    );
  }
}

class NewsFeedPage2 extends StatelessWidget {
  final List<Article> articles;
  final List<int> quantities;
  final void Function(int) incrementQuantity;
  final void Function(int) decrementQuantity;

  const NewsFeedPage2({
    Key? key,
    required this.articles,
    required this.quantities,
    required this.incrementQuantity,
    required this.decrementQuantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 400),
      child: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (BuildContext context, int index) {
          final Article item = articles[index];
          return Container(
            height: 150,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFE0E0E0)),
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(item.imageUrl),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Rp ${item.harga.toString()}",
                        style: GoogleFonts.poppins(),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () => decrementQuantity(index),
                          ),
                          Text(quantities[index].toString()),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () => incrementQuantity(index),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Article {
  final String title;
  final int harga;
  final String imageUrl;

  Article({
    required this.title,
    required this.harga,
    required this.imageUrl,
  });
}

class TransactionHistory {
  final String date;
  final String totalHarga;
  final String diskon;
  final String totalBayar;

  TransactionHistory({
    required this.date,
    required this.totalHarga,
    required this.diskon,
    required this.totalBayar,
  });
}
