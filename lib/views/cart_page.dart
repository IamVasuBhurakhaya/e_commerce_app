import 'package:e_commerce_app/utils/product_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double totalPrice = 0;

  @override
  void initState() {
    cartItem.forEach((elem) {
      totalPrice += (elem['price'] * elem['qty']);
    });
    super.initState();
  }

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
          : SingleChildScrollView(
              child: Column(
                children: [
                  Column(
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
                                Text(e['title']),
                                // IconButton(
                                //   onPressed: () {
                                //     cartItem.remove(e);
                                //     setState(() {});
                                //   },
                                //   icon: Icon(Icons.remove),
                                // ),

                                IconButton(
                                  onPressed: () {
                                    if (e['qty'] <= 1) {
                                      cartItem.remove(e);
                                      totalPrice -= e['price'];
                                    } else {
                                      e['qty']--;
                                      totalPrice -= e['price'];
                                    }
                                    setState(() {});
                                  },
                                  icon: Icon(Icons.remove),
                                ),

                                Text(e['qty'].toString()),

                                IconButton(
                                  onPressed: () {
                                    e['qty']++;
                                    totalPrice += e['price'];
                                    setState(() {});
                                  },
                                  icon: Icon(Icons.add),
                                ),

                                Text(totalPrice.toString()),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  Column(
                    children: [
                      Container(
                        color: Colors.red,
                        height: 300,
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
