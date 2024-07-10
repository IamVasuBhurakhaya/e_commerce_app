import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/utils/product_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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

                    //Category box---------------------------------

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: allCategory
                            .map(
                              (e) => const SizedBox(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        right: 20,
                                      ),
                                    ),
                                    CircleAvatar(
                                      radius: 40,
                                      child: Text("E-com"),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    //All Product Text --------------------------------------------

                    const Row(
                      children: [
                        Text(
                          "All Product",
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),

                    //Product card --------------------------------------------

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: allProduct
                            .map(
                              (e) => GestureDetector(
                                onTap: () {
                                  // Route route = MaterialPageRoute(
                                  //   builder: (context) =>
                                  //       DetailPage(Product: e),
                                  // );

                                  Navigator.of(context)
                                      .pushNamed('detail_page', arguments: e);
                                },
                                child: Container(
                                  height: 250,
                                  width: 170,
                                  margin: const EdgeInsets.only(
                                    right: 10,
                                    bottom: 10,
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.shade200,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(5, 5),
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: size.height * 0.15,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Image(
                                            image: NetworkImage(
                                              e['thumbnail'],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              e['title'],
                                              style: const TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              "\$ ${e['price']}",
                                              style: const TextStyle(
                                                fontSize: 20,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: RatingBar.builder(
                                          allowHalfRating: true,
                                          initialRating: e['rating'].toDouble(),
                                          itemCount: 5,
                                          itemSize: 22,
                                          itemBuilder: (context, _) =>
                                              const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {},
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
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
