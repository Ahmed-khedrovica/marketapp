import 'package:ecommrce/compoments/product_card.dart';
import 'package:ecommrce/utlis/helper_functions.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';
import '../utlis/constants.dart';

class SearchBody extends StatefulWidget {
  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  List<Product> searchProducts = [];
  TextEditingController controller = TextEditingController();
  void refreshFav(int index) {
    // if product fav -> remove from fav
    // if product not fav -> add to fav\
    Product product = searchProducts[index];
    updateFavourite(product);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            height: 100,
            padding: EdgeInsets.symmetric(horizontal: 25,vertical: 20),
            decoration: BoxDecoration(
              color: surface,
              boxShadow: [
                BoxShadow(color: Colors.black,blurRadius: 5),
              ]
            ),
            child: TextField(
              controller: controller,
              onChanged: (value){
                if(value.isEmpty){
                  searchProducts = [];
                }else {
                  searchProducts = search(value);
                }
                setState(() {

                });
              },
              maxLines: 1,
              style: TextStyle(fontSize: 22, color: bodyText),

              decoration: InputDecoration(
                fillColor: surface,
                filled: true,
                prefixIcon: Icon(Icons.search),
                suffixIcon: GestureDetector(
                    onTap: (){
                      //controller.clear();
                      controller.text = '';
                      searchProducts = [];
                      setState(() {

                      });
                    },
                    child: Icon(Icons.close)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: titleText),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: titleText),
                ),
                hintText: 'Search....',
                hintStyle: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: titleText,
                ),
              ),
            ),
          ),

          Expanded(
            flex: 4,
            child: GridView.builder(
              itemCount: searchProducts.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 10,
                // width / height
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                return ProductCard(product: searchProducts[index],
                  onTap: (){
                  refreshFav(index);
                  },);
              },
            ),
          ),
        ],
      ),
    );
    ;
  }
}
