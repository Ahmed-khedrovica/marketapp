import 'package:flutter/cupertino.dart';

import '../utlis/constants.dart';

class CustomTitle extends StatelessWidget {
   final String title;
  const CustomTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return  Text(
      title,
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: titleText,
      ),
    );
  }
}
