import 'package:e_commerce_app/views/cart_page.dart';
import 'package:e_commerce_app/views/detail_page.dart';
import 'package:e_commerce_app/views/favourite_page.dart';
import 'package:e_commerce_app/views/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const Myapp(),
  );
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        'detail_page': (context) => const DetailPage(),
        'cart_page': (context) => const CartPage(),
        'favorites_page': (context) => FavoritesPage(),
      },
    );
  }
}
