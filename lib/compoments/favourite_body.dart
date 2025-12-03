import 'package:ecommrce/compoments/custom_title.dart';
import 'package:flutter/material.dart';

import '../utlis/constants.dart';
import 'favourite_product_card.dart';

class FavouriteBody extends StatefulWidget {
  const FavouriteBody({super.key});

  @override
  State<FavouriteBody> createState() => _FavouriteBodyState();
}

class _FavouriteBodyState extends State<FavouriteBody> {
  void removeFromFav(int index){
    currentUser.favorites.removeAt(index);
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomTitle(title: 'Favourite Products'),
          Expanded(
            child: ListView.builder(
              itemCount: currentUser.favorites.length,
              itemBuilder: (context, index) {
                return FavouriteProductCard(
                  product: currentUser.favorites[index],
                  onRemove: (){
                    removeFromFav(index);
                },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

