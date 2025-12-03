import 'package:ecommrce/utlis/constants.dart';
import 'package:flutter/material.dart';


class QuantityButton extends StatelessWidget {
  final Function onTap;
  final IconData icon;
  final double btnPadding;
  final Color btn2BackgroundColor;
  final Color? btn2ForegroundColor;

  const QuantityButton({super.key, required this.onTap, required this.icon,
    this.btnPadding = 4,
    this.btn2BackgroundColor = Colors.transparent,
    this.btn2ForegroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: btn2ForegroundColor == null ? bodyText : btn2ForegroundColor!),
          borderRadius: BorderRadius.circular(15),
          color: btn2BackgroundColor,
        ),
        child: Padding(
          padding: EdgeInsets.all(btnPadding),
          child: Icon(icon, color: btn2ForegroundColor == null ? bodyText : btn2ForegroundColor!),
        ),
      ),
    );
  }
}
