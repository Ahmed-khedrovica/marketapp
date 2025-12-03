import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/categroy.dart';

class CategoryCart extends StatelessWidget {
  final Category category;
  final Function onTap;
  final bool active;

  const CategoryCart({
    super.key,
    required this.category,
    required this.onTap,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: active ? 20 : 15,
                backgroundImage: CachedNetworkImageProvider(category.image),
              ),
              Text(category.name),
              AnimatedContainer(
                color: Colors.purple,
                height: 3,
                width: active ? 40 : 0,
                duration: Duration(milliseconds: 500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
