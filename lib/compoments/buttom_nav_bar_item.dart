
import 'package:flutter/material.dart';

class BottomNavBarItem extends StatelessWidget {
  final bool active;
  final IconData activeIcon;
  final IconData inActiveIcon;
  final Function changeIndex;

  const BottomNavBarItem({
    super.key,
    required this.activeIcon,
    required this.active,
    required this.inActiveIcon,
    required this.changeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeIndex();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: active ? 4 : 0,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          SizedBox(height: 5),
          Icon(
            active ? activeIcon : inActiveIcon,
            color: active ? Colors.white : Colors.grey,
            size: 35,
          ),
        ],
      ),
    );
  }
}