import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommrce/compoments/Product_details_screen.dart';
import 'package:ecommrce/utlis/helper_functions.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';
import '../utlis/constants.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final Function onTap;

  const ProductCard({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(product: product, refreshFav: onTap),
          ),
        );
      },
      child: Card(
        color: surface,
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(imageUrl: product.images[0]),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    product.title,
                    maxLines: 1,
                    style: TextStyle(color: titleText),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${product.price.toInt()}',
                        maxLines: 1,
                        style: TextStyle(
                          color: bodyText,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          onTap();
                        },

                        child: isFav(product)
                            ? Icon(Icons.favorite, color: Colors.red)
                            : Icon(Icons.favorite_border),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
