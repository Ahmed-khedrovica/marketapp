import 'package:ecommrce/compoments/profile_body.dart';
import 'package:flutter/material.dart';

import '../compoments/cart_body.dart';
import '../compoments/custom_buttom_nav_bar.dart';
import '../compoments/favourite_body.dart';
import '../compoments/home_body.dart';
import '../compoments/search_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> bodies = [
    HomeBody(),
    SearchBody(),
    FavouriteBody(),
    CartBody(),
    ProfileBody(),
  ];

  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: bodies[currentIndex],
      ),
      bottomNavigationBar: CustomBottomNanBar(
        currentIndex: currentIndex,
        changeIndex: changeIndex,
      ),
    );
  }
}
