import 'package:ecommrce/compoments/quantity_button.dart';
import 'package:flutter/material.dart';


class QuantityRow extends StatelessWidget {
  final Function increment;
  final Function decrement;
  final int quantity;
  final double fontSize;
  final double btnPadding;
  final Color btn2BackgroundColor;
  final Color? btn2ForegroundColor;


  const QuantityRow({
    super.key,
    required this.increment,
    required this.decrement,
    required this.quantity,
    this.fontSize = 22,
    this.btnPadding = 4,
    this.btn2BackgroundColor = Colors.transparent,
    this.btn2ForegroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        QuantityButton(
          btnPadding: btnPadding,
          onTap: () {
            decrement();
          },
          icon: Icons.remove,
        ),
        Text(
          '$quantity'.padLeft(2, '0'),
          style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w500),
        ),
        QuantityButton(
            onTap: () {
              increment();
            },
            icon: Icons.add,
            btnPadding: btnPadding,
            btn2BackgroundColor: btn2BackgroundColor,
            btn2ForegroundColor: btn2ForegroundColor,
        ),
      ],
    );
  }
}