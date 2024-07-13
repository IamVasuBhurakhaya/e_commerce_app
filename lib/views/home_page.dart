import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/utils/product_utils.dart';
import 'package:e_commerce_app/views/components/category_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String Selected = "All";
  RangeValues sliderValue = RangeValues(1, 5000);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    List image = [
      "https://www.shutterstock.com/image-vector/mobile-application-shopping-online-on-260nw-1379237159.jpg",
      "https://cms.nvctrading.com/app/uploads/2017/12/online-shopping.jpg",
      "https://miro.medium.com/v2/resize:fit:1018/1*iAu65xDmvpVdBJgps6EDEw.png",
      "https://img.freepik.com/premium-photo/online-fashion-shopping-with-computer_23-2150400628.jpg",
    ];

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
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.of(context).pushNamed('favorites_page');
            },
          ),
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
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
              ),
              child: const Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      "https://wallpapers.com/images/hd/professional-profile-pictures-1080-x-1080-460wjhrkbwdcp1ig.jpg"),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {},
            ),
          ],
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
//DropDown--------------------------------------------------------------
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: DropdownButton(
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
                        ),
                        SizedBox(
                          width: size.width * 0.28,
                        ),
                        Visibility(
                          visible: Selected != "All",
                          child: ActionChip(
                            onPressed: () {
                              setState(() {
                                Selected = "All";
                              });
                            },
                            avatar: const Icon(Icons.clear),
                            label: const Text("Clear"),
                          ),
                        ),
                      ],
                    ),

                    Visibility(
                        visible: Selected != "All",
                        child: Row(
                          children: [
                            Text(
                              "From\n${sliderValue.start.toInt()}",
                              textAlign: TextAlign.center,
                            ),
                            Expanded(
                              child: RangeSlider(
                                  labels: RangeLabels(
                                    sliderValue.start.toInt().toString(),
                                    sliderValue.end.toInt().toString(),
                                  ),
                                  min: 1,
                                  max: 5000,
                                  values: sliderValue,
                                  onChanged: (val) {
                                    sliderValue = val;
                                    setState(() {});
                                  }),
                            ),
                            Text(
                              "From\n${sliderValue.end.toInt()}",
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )),

                    const SizedBox(
                      height: 20,
                    ),
                    // Slider(value: 10, onChanged:(value) => ,),

                    categoryTile(
                      context: context,
                      selected: Selected,
                      sliderValue: sliderValue,
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
