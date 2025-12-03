import 'package:ecommrce/compoments/custom_title.dart';
import 'package:ecommrce/compoments/product_card.dart';
import 'package:ecommrce/data/categories.dart';
import 'package:ecommrce/models/product.dart';
import 'package:ecommrce/utlis/constants.dart';
import 'package:ecommrce/utlis/helper_functions.dart';
import 'package:flutter/material.dart';

import 'categoty_cart.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  int currentIndex = 0;

  List<Product> filteredProducts = filter('Clothes');

  void refreshFav(int index) {
    // if product fav -> remove from fav
    // if product not fav -> add to fav\
    Product product = filteredProducts[index];

    // refreshFav
    updateFavourite(product);
    setState(() {});
  }

  void changeIndex(int index) {
    currentIndex = index;
    filteredProducts = filter(categories[index].name);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTitle(title: 'Products'),
          SizedBox(height: 10),
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CategoryCart(
                  category: categories[index],
                  onTap: () {
                    changeIndex(index);
                  },
                  active: currentIndex == index,
                );
              },
            ),
          ),
          Expanded(
            flex: 4,
            child: GridView.builder(
              itemCount: filteredProducts.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 10,
                // width / height
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                return ProductCard(
                  product: filteredProducts[index],
                  onTap: () {

                    // refreshFav
                    refreshFav(index);
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
