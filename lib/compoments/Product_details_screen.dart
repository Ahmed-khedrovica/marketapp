import 'package:ecommrce/compoments/price_info.dart';
import 'package:ecommrce/compoments/product_images_section.dart';
import 'package:ecommrce/compoments/quantity_row.dart';
import 'package:ecommrce/models/product.dart';
import 'package:ecommrce/utlis/constants.dart';
import 'package:ecommrce/utlis/helper_functions.dart';
import 'package:flutter/material.dart';

import 'color_row.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;
  final Function refreshFav;

  ProductDetailsScreen({super.key, required this.product, required this.refreshFav});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  PageController controller = PageController();
  int colorIndex = 0;
  int quantity = 1;
  late Icon favIcon;

  @override
  void initState() {
    super.initState();

   updateFavIcon();
  }
  void updateFavIcon(){
    if (isFav(widget.product)) {
      favIcon = Icon(Icons.favorite, size: 30, color: Colors.red);
    } else {
      favIcon = Icon(Icons.favorite_border, size: 30);
    }
  }


  void changeColor(int index) {
    colorIndex = index;
    setState(() {});
  }

  void decrement() {
    if (quantity > 1) {
      --quantity;
      setState(() {});
    }
  }

  void increment() {
    if (quantity < 100) {
      ++quantity;
      setState(() {});
    }
  }

  void addToCartProcess(){
    addToCart(widget.product, quantity);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: buttons,
          duration: Duration(seconds: 1),
          content: Text(
              'The Product Added To Cart ',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          ProductImagesSection(controller: controller, product: widget.product),
          Expanded(
            child: Padding(
              padding: padding,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 20,
                  children: [
                    Text(
                      widget.product.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 45,
                        color: titleText,
                      ),
                    ),
                    PriceInfo(price: widget.product.price),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Colors',
                          style: TextStyle(fontSize: 16, color: bodyText),
                        ),
                        ColorRow(
                          changeColor: changeColor,
                          colorIndex: colorIndex,
                        ),
                      ],
                    ),
                    Text(
                      widget.product.description,
                      style: TextStyle(color: bodyText),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        QuantityRow(
                          increment: increment,
                          decrement: decrement,
                          quantity: quantity,
                        ),
                       GestureDetector(
                         onTap: (){
                           widget.refreshFav();
                           updateFavIcon();
                           setState(() {

                           });
                         },
                         child: favIcon,
                       )
                      ],
                    ),
                    SizedBox(height: 60),
                    AddToCart(action: addToCartProcess,),
                    SizedBox(height: 7,)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class AddToCart extends StatelessWidget {
  final Function action;
  const AddToCart({super.key, required this.action});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (){
           action();
        },
        style: ButtonStyle(
          padding: WidgetStatePropertyAll(
            EdgeInsets.all(20),

          ),
          backgroundColor: WidgetStatePropertyAll(buttons),
          foregroundColor: WidgetStatePropertyAll(surface),
          overlayColor: WidgetStatePropertyAll(Colors.grey[800]!),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Add To Cart'),
            Icon(Icons.add_shopping_cart, color: surface, size: 25,),
          ],

        ));
  }
}

