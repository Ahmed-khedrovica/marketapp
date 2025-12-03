import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../models/product.dart';
import '../utlis/constants.dart';

class FavouriteProductCard extends StatelessWidget {
  final Product product;
  final Function onRemove;
  const FavouriteProductCard({super.key, required this.product, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: surface,
      clipBehavior: Clip.antiAlias,
      child: Slidable(
        endActionPane: ActionPane(
          motion: BehindMotion(),
          children: [
            CustomSlidableAction( onPressed: (context) {
              onRemove();
            },
              backgroundColor: Colors.red,
              foregroundColor: surface,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.delete, size: 30,),
                  Text('Remove', style: TextStyle(fontSize: 22),)
                ],
              ),

            )
          ],
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              CachedNetworkImage(imageUrl: product.images[0], width: 130),
              Padding(
                padding: EdgeInsets.all(20),
                child: IntrinsicWidth(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        maxLines: 2,
                        product.title,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: bodyText,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.category.name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: titleText,
                            ),
                          ),
                          Text(
                            '\$${product.price}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: titleText,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
