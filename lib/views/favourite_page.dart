import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/product_utils.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: favoriteItems.length,
          itemBuilder: (context, index) {
            final product = favoriteItems[index];
            return ListTile(
              leading: Image.network(product['thumbnail']),
              title: Text(product['title']),
              subtitle: Text("\$${product['price']}"),
            );
          },
        ),
      ),
    );
  }
}
