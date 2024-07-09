import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cashier8/screens/cart_screen.dart'; // Pastikan ini mengimpor CartScreen

// ... kode HomeScreen lainnya

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  String searchValue = '';

  void _navigateToScreen(int index) {
    switch (index) {
      case 0:
        // Handle navigation to Home if needed
        break;
      case 1:
        // Handle navigation to CartScreen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CartScreen()),
        );
        break;
      case 2:
        // Handle navigation to History if needed
        break;
      case 3:
        // Handle navigation to Profile if needed
        break;
      default:
        break;
    }
  }

  final List<NavigationDestination> _navBarItems = [
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

  String dropdownValue1 = 'A';
  String dropdownValue2 = 'Category 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: GoogleFonts.poppins(color: Colors.white),
        ),
        backgroundColor: Color(0xFF415F9D),
      ),
      body: Column(
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
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
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: DropdownButton<String>(
                        value: dropdownValue1,
                        icon: Icon(Icons.arrow_drop_down, color: Colors.grey),
                        iconSize: 24,
                        elevation: 16,
                        underline: Container(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue1 = newValue!;
                          });
                        },
                        items: List.generate(26, (index) {
                          return DropdownMenuItem<String>(
                            value: String.fromCharCode(index + 65),
                            child: Text(String.fromCharCode(index + 65)),
                          );
                        }),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Container(
                  width: 150,
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
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: DropdownButton<String>(
                      value: dropdownValue2,
                      icon: Icon(Icons.arrow_drop_down, color: Colors.grey),
                      iconSize: 24,
                      elevation: 16,
                      underline: Container(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue2 = newValue!;
                        });
                      },
                      items: [
                        DropdownMenuItem<String>(
                          value: 'Category 1',
                          child: Text('Helm'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: NewsFeedPage2(),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Color(0xFF233B6E),
          labelTextStyle:
              MaterialStateProperty.all(TextStyle(color: Colors.white)),
          iconTheme:
              MaterialStateProperty.all(IconThemeData(color: Colors.white)),
        ),
        child: NavigationBar(
          backgroundColor: Color(0xFF415F9D),
          animationDuration: const Duration(seconds: 1),
          selectedIndex: _selectedIndex,
          onDestinationSelected: (index) {
            setState(() {
              _selectedIndex = index;
            });
            switch (index) {
              case 0:
                // Handle navigation to Home if needed
                break;
              case 1:
                // Handle navigation to CartScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartScreen()),
                );
                break;
              case 2:
                // Handle navigation to History if needed
                break;
              case 3:
                // Handle navigation to Profile if needed
                break;
              default:
                break;
            }
          },
          destinations: _navBarItems,
        ),
      ),
    );
  }
}

class NewsFeedPage2 extends StatelessWidget {
  const NewsFeedPage2({Key? key}) : super(key: key);

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
              height: 136,
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
                        image: AssetImage('images/helm2.png'),
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
