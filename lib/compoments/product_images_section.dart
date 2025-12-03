import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/product.dart';
import '../utlis/constants.dart';

class ProductImagesSection extends StatelessWidget {
  final PageController controller;
  final Product product;
  const ProductImagesSection({super.key, required this.controller, required this.product});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: controller,
            itemCount: product.images.length,
            itemBuilder: (context, index) {
              return Image.network(
                product.images[index],
                fit: BoxFit.fill,
              );
            },
          ),
          Positioned(
            top: 40,
            left: 30,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.arrow_back, color: Colors.black),
              ),
            ),
          ),
          SmoothPageIndicator(
            controller: controller,
            count: product.images.length,
            effect: ExpandingDotsEffect(
              dotColor: surface,
              activeDotColor: Colors.black,
              radius: 10,
              dotHeight: 13,
              spacing: 10,
            ),
            onDotClicked: (index) {
              controller.animateToPage(
                index,
                duration: Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            },
          ),
        ],
      ),
    );
  }
}
