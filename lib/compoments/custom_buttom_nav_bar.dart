import 'package:flutter/material.dart';

import '../utlis/constants.dart';
import 'buttom_nav_bar_item.dart';

class CustomBottomNanBar extends StatelessWidget {
  final int currentIndex;
  final Function changeIndex;

  const CustomBottomNanBar({
    super.key,
    required this.currentIndex,
    required this.changeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: bottomNavBar,
        borderRadius: BorderRadius.only(
          topLeft: Radius.elliptical(40, 20),
          topRight: Radius.elliptical(40, 20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomNavBarItem(
            activeIcon: Icons.home,
            active: currentIndex == 0,
            inActiveIcon: Icons.home_outlined,
            changeIndex: (){
              changeIndex(0);
            },
          ),
          BottomNavBarItem(
            activeIcon: Icons.search,
            active: currentIndex == 1,
            inActiveIcon: Icons.search,
            changeIndex: (){
              changeIndex(1);
            },
          ),
          BottomNavBarItem(
            activeIcon: Icons.favorite,
            active: currentIndex == 2,
            inActiveIcon: Icons.favorite_border,
            changeIndex: (){
              changeIndex(2);
            },
          ),
          BottomNavBarItem(
            activeIcon: Icons.shopping_cart,
            active: currentIndex == 3,
            inActiveIcon: Icons.shopping_cart_outlined,
            changeIndex: (){
              changeIndex(3);
            },
          ),
          BottomNavBarItem(
            activeIcon: Icons.person,
            active: currentIndex == 4,
            inActiveIcon: Icons.perm_identity,
            changeIndex: (){
              changeIndex(4);
            },
          ),
        ],
      ),
    );
  }
}