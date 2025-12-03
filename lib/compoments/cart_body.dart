import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommrce/compoments/custom_title.dart';
import 'package:ecommrce/compoments/quantity_row.dart';
import 'package:ecommrce/models/cart_item.dart';
import 'package:ecommrce/utlis/constants.dart';
import 'package:ecommrce/utlis/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

class CartBody extends StatefulWidget {
  const CartBody({super.key});

  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  double totalPrice = 0.0;

  @override
  void initState() {
    super.initState();
    totalPrice = calcPrice();
  }

  void increment(CartItem item) {
    if (item.quantity < 100) {
      ++item.quantity;
      totalPrice = calcPrice();
      setState(() {});
    }
  }

  void decrement(CartItem item) {
    if (item.quantity > 1) {
      --item.quantity;
      totalPrice = calcPrice();
      setState(() {});
    }
  }

  void remove(int index) {
    currentUser.cart.items.removeAt(index);
    totalPrice = calcPrice();
    setState(() {});
  }

  void showBill() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: surface,
          scrollable: false,
          content: BillSummary(totalPrice: totalPrice),
          actions: [
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
              currentUser.cart.items.clear();
              setState(() {

              });
            },
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(buttons),
                  foregroundColor: WidgetStatePropertyAll(surface),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ))
                ),
                
                child: Text('Ok'))
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        children: [
          CustomTitle(title: 'Cart'),
          Expanded(
            child: ListView.builder(
              itemCount: currentUser.cart.items.length,
              itemBuilder: (context, index) {
                return ProductCardListTile(
                  item: currentUser.cart.items[index],
                  decrement: () {
                    decrement(currentUser.cart.items[index]);
                  },
                  increment: () {
                    increment(currentUser.cart.items[index]);
                  },
                  remove: () {
                    remove(index);
                  },
                );
              },
            ),
          ),
          Opacity(
            opacity: currentUser.cart.items.isNotEmpty? 1:0,
            child: SlideAction(
              onSubmit: () {
                return Future.delayed(Duration(seconds: 2), () {
                  showBill();
                });
              },
              enabled: currentUser.cart.items.isNotEmpty? true : false,
              text: 'Slide To Pay \$$totalPrice',
              borderRadius: 10,
              outerColor: buttons,
              sliderButtonIcon: Icon(Icons.shopping_cart_checkout_outlined),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCardListTile extends StatelessWidget {
  final CartItem item;
  final Function decrement;
  final Function increment;
  final Function remove;

  const ProductCardListTile({
    super.key,
    required this.item,
    required this.decrement,
    required this.increment,
    required this.remove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: surface,
      clipBehavior: Clip.antiAlias,
      child: IntrinsicHeight(
        child: Row(
          spacing: 5,
          children: [
            CachedNetworkImage(imageUrl: item.product.images[0], width: 100),

            Padding(
              padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.product.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      color: bodyText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  QuantityRow(
                    increment: increment,
                    decrement: decrement,
                    quantity: item.quantity,
                    btnPadding: 0,
                    fontSize: 10,
                    btn2BackgroundColor: buttons,
                    btn2ForegroundColor: surface,
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                remove();
              },
              child: Icon(Icons.close, size: 30, color: buttons),
            ),
          ],
        ),
      ),
    );
  }
}

class BillSummary extends StatelessWidget {
  final double totalPrice;
  const BillSummary({super.key, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      color: surface,
      child: Column(
        children: [
          Text(
            'Bill Summary',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: currentUser.cart.items.length,
              itemBuilder: (context, index) {
                return BillItemRow(item: currentUser.cart.items[index]);
              },
              separatorBuilder: (context, _) {
                return Divider(color: bodyText);
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total',
                style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 22,
                ),
              ),
              Text(
                '\$$totalPrice',
                style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class BillItemRow extends StatelessWidget {
  final CartItem item;

  const BillItemRow({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Row(
        children: [
          Text(item.product.title, overflow: TextOverflow.ellipsis),
          Text(
            '${item.quantity} X \$${item.product.price}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
