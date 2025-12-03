import 'package:flutter/cupertino.dart';

import '../utlis/constants.dart';

class PriceInfo extends StatelessWidget {
  final double price;
  const PriceInfo({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Price',
          style: TextStyle(fontSize: 16, color: titleText),
        ),
        Text(
          '\$${price}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: bodyText,
          ),
        )
      ],
    );
  }
}