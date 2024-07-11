import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/utils/product_utils.dart';
import 'package:e_commerce_app/views/components/category_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List image = [
  "https://www.shutterstock.com/image-vector/mobile-application-shopping-online-on-260nw-1379237159.jpg",
  "https://cms.nvctrading.com/app/uploads/2017/12/online-shopping.jpg",
  "https://miro.medium.com/v2/resize:fit:1018/1*iAu65xDmvpVdBJgps6EDEw.png",
  "https://img.freepik.com/premium-photo/online-fashion-shopping-with-computer_23-2150400628.jpg",
];

class _HomePageState extends State<HomePage> {
  String Selected = "All";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        title: const Text(
          "Home Page",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
            color: Colors.black38,
          ),
        ),
        actions: const [
          Icon(Icons.search),
          SizedBox(
            width: 10,
          ),
          Icon(CupertinoIcons.cart),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey.shade200,
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: CircleAvatar(
              radius: 50,
              child: Image(
                image: NetworkImage(
                    "https://wallpapers.com/images/hd/professional-profile-pictures-1080-x-1080-460wjhrkbwdcp1ig.jpg"),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                child: Column(
                  children: [
                    //Slider----------------------------------------

                    CarouselSlider(
                      options: CarouselOptions(
                        height: size.height * 0.25,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: 1,
                      ),
                      items: image.map((imageUrl) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black26),
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: NetworkImage(imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    DropdownButton(
                      value: Selected,
                      onChanged: (val) {
                        setState(
                          () {
                            Selected = val.toString();
                          },
                        );
                      },
                      items: [
                        const DropdownMenuItem(
                          value: "All",
                          child: Text("All Product"),
                        ),
                        ...allCategory.map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text("All Products"),
                    categoryTile(context: context, Selected: "All"),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(Selected),
                    categoryTile(context: context, Selected: Selected),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
