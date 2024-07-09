import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';// Import HistoryScreen
import 'package:cashier8/screens/transaction_screen.dart'; // Import TransactionScreen

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String searchValue = '';
  int _selectedIndex = 1; // Set to 1 for the Cart tab

  final List<NavigationDestination> _destinations = [
    NavigationDestination(
      icon: Icon(Icons.home_outlined),
      selectedIcon: Icon(Icons.home_rounded),
      label: 'Home',
    ),
    NavigationDestination(
      icon: Icon(Icons.shopping_cart_outlined),
      selectedIcon: Icon(Icons.shopping_cart_rounded),
      label: 'Cart',
    ),
    NavigationDestination(
      icon: Icon(Icons.assignment_outlined),
      selectedIcon: Icon(Icons.assignment_rounded),
      label: 'History',
    ),
    NavigationDestination(
      icon: Icon(Icons.person_outline_rounded),
      selectedIcon: Icon(Icons.person_rounded),
      label: 'Profile',
    ),
  ];

  void _navigateToScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.popUntil(context, ModalRoute.withName('/')); // Navigate back to HomeScreen
        break;
      case 1:
        // Already in CartScreen, do nothing
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TransactionScreen()), // Navigate to HistoryScreen
        );
        break;
      case 3:
        // Navigate to ProfileScreen (implement this if you have one)
        break;
      default:
        break;
    }
  }

  void _addToCart() {
    // Implement your logic here, e.g., add item to cart
    // You can also navigate to the transaction screen here
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TransactionScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: GoogleFonts.poppins(color: Colors.white),
        ),
        backgroundColor: Color(0xFF415F9D),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          searchValue = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: NewsFeedPage2(),
              ),
            ],
          ),
          Positioned(
            bottom: 35, // Adjust this value as needed
            right: 16,
            child: FloatingActionButton(
              onPressed: _addToCart,
              child: Icon(Icons.shopping_cart),
              backgroundColor: Color(0xFF415F9D),
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Color(0xFF233B6E),
          labelTextStyle: MaterialStateProperty.all(TextStyle(color: Colors.white)),
          iconTheme: MaterialStateProperty.all(IconThemeData(color: Colors.white)),
        ),
        child: NavigationBar(
          backgroundColor: Color(0xFF415F9D),
          animationDuration: const Duration(seconds: 1),
          selectedIndex: _selectedIndex,
          onDestinationSelected: (index) {
            _navigateToScreen(index);
          },
          destinations: _destinations,
        ),
      ),
    );
  }
}

class NewsFeedPage2 extends StatefulWidget {
  const NewsFeedPage2({Key? key}) : super(key: key);

  @override
  _NewsFeedPage2State createState() => _NewsFeedPage2State();
}

class _NewsFeedPage2State extends State<NewsFeedPage2> {
  final List<int> _quantities = List<int>.filled(_articles.length, 0);

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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        child: ListView.builder(
          itemCount: _articles.length,
          itemBuilder: (BuildContext context, int index) {
            final item = _articles[index];
            return Container(
              height: 150,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFE0E0E0)),
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: const EdgeInsets.all(8),
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
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item.harga,
                          style: GoogleFonts.poppins(),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item.stok,
                          style: GoogleFonts.poppins(),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () => _decrementQuantity(index),
                            ),
                            Text(_quantities[index].toString()),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () => _incrementQuantity(index),
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
      ),
    );
  }
}

class Article {
  final String title;
  final String imageUrl;
  final String harga;
  final String stok;

  Article({
    required this.title,
    required this.imageUrl,
    required this.harga,
    required this.stok,
  });
}

final List<Article> _articles = [
  Article(
    title: "Helm Classic",
    harga: "250.000",
    stok: "Stok : 20",
    imageUrl: "images/helm2.png",
  ),
  Article(
    title: "Helm Classic",
    harga: "250.000",
    stok: "Stok : 20",
    imageUrl: "images/helm2.png",
  ),
  Article(
    title: "Helm Classic",
    harga: "250.000",
    stok: "Stok : 20",
    imageUrl: "images/helm2.png",
  ),
  Article(
    title: "Helm Classic",
    harga: "250.000",
    stok: "Stok : 20",
    imageUrl: "images/helm2.png",
  ),
  Article(
    title: "Helm Classic",
    harga: "250.000",
    stok: "Stok : 20",
    imageUrl: "images/helm2.png",
  ),
];
