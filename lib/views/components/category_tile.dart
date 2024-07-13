import 'package:e_commerce_app/utils/product_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Widget categoryTile({
  required BuildContext context,
  required String selected,
  RangeValues sliderValue = const RangeValues(1, 5000),
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Text(
          selected,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade800,
          ),
        ),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: allProduct
              .where((e) => selected == 'All'
                  ? true
                  : selected == e['category'] &&
                      e['price'] >= sliderValue.start &&
                      e['price'] <= sliderValue.end)
              .map(
                (e) => GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed('detail_page', arguments: e);
                  },
                  child: Container(
                    height: 250,
                    width: 170,
                    margin: const EdgeInsets.only(right: 10, bottom: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 120,
                              child: Center(
                                child: Image(
                                  image: NetworkImage(e['thumbnail']),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              e['title'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "\$${e['price']}",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.green.shade700,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const Spacer(),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: RatingBar.builder(
                                initialRating: e['rating'].toDouble(),
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 20,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 1.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {},
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            icon: Icon(
                              favoriteItems.contains(e)
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.red.shade700,
                            ),
                            onPressed: () {
                              if (favoriteItems.contains(e)) {
                                favoriteItems.remove(e);
                              } else {
                                favoriteItems.add(e);
                              }
                              // (context as Element).reassemble();
                            },
                          ),
                        ),
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
