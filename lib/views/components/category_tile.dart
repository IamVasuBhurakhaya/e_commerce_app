import 'package:e_commerce_app/utils/product_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Widget categoryTile({required BuildContext context, required String Selected}) {
  return Column(
    children: [
      //All Product Text --------------------------------------------

      const Row(
        children: [
          Text(
            "All Product",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
          ),
        ],
      ),

      //Product card --------------------------------------------

      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: allProduct
              .where(
                  (e) => Selected == 'All' ? true : Selected == e['category'])
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 120,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e['title'],
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
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
                            itemBuilder: (context, _) => const Icon(
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
  );
}
