import 'package:e_commerce_app/utils/product_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Page"),
        actions: [
          IconButton(
            onPressed: () {
              Route route = MaterialPageRoute(
                builder: (context) => const CartPage(),
              );
              Navigator.of(context).push(route);
            },
            icon: const Icon(
              CupertinoIcons.cart,
            ),
          ),
        ],
      ),
      body: cartItem.isEmpty
          ? Center()
          : Column(
              children: cartItem
                  .map(
                    (e) => Container(
                      height: 200,
                      child: Row(
                        children: [
                          Image(
                            image: NetworkImage(
                              e['thumbnail'],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              cartItem.remove(e);
                              setState(() {});
                            },
                            icon: Icon(Icons.remove),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
    );
  }
}
