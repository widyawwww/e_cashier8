import 'package:cashier8/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import ProfileScreen

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 3; // Set to 1 for the Cart tab

  void _navigateToScreen(int index) {
    switch (index) {
      case 0:
        // Handle navigation to Home if needed
        break;
      case 1:
        // Handle navigation to CartScreen
        break;
      case 2:
        // Handle navigation to History if needed
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: GoogleFonts.poppins(color: Colors.white),
        ),
        backgroundColor: Color(0xFF415F9D),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [],
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
                break;
              case 2:
                // Handle navigation to History if needed
                break;
              case 3:
                // Handle navigation to Profile if needed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
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
