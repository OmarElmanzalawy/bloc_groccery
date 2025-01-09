import 'package:bloc_groccery/features/cart/ui/cart.dart';
import 'package:bloc_groccery/features/home/ui/home.dart';
import 'package:bloc_groccery/features/wishlist/ui/wishlist.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.teal,
        // iconTheme: IconThemeData(color: Colors.white), 
      ),
      // home: Home(),
      initialRoute: '/home',
      routes: {
        '/home': (context) => Home(),
        '/cart': (context) => Cart(),
        '/wishlist': (context) => Wishlist(),
      },
    );
  }
}
