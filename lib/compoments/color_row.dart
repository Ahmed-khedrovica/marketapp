import 'package:flutter/material.dart';

import 'color_circle.dart';

class ColorRow extends StatelessWidget {
  final Function changeColor;
  final int colorIndex;

  const ColorRow({
    super.key,
    required this.changeColor,
    required this.colorIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        ColorCircle(
          color: Colors.deepPurpleAccent,
          isActive: colorIndex == 0,
          onTap: () {
            changeColor(0);
          },
        ),
        ColorCircle(
          color: Colors.deepOrange,
          isActive: colorIndex == 1,
          onTap: () {
            changeColor(1);
          },
        ),
        ColorCircle(
          color: Colors.black,
          isActive: colorIndex == 2,
          onTap: () {
            changeColor(2);
          },
        ),
      ],
    );
  }
}