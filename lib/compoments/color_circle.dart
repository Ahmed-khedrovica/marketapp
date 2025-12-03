
import 'package:flutter/material.dart';

class ColorCircle extends StatelessWidget {
  final Color color;
  final Function onTap;
  final bool isActive;
  const ColorCircle({super.key, required this.color, required this.onTap, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap();
      },
      child: Container(
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
          border: Border.all(
            color: isActive ? color : Colors.transparent,
          ),
          shape: BoxShape.circle,
        ),
        child: Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle
          ),
        ),
      ),
    );
  }
}