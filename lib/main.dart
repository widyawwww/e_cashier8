import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cashier8/screens/welcome_screen.dart';
import 'package:cashier8/screens/transaction_provider_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TransactionProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreens(),
    );
  }
}
