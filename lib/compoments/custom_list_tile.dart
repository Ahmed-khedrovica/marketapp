import 'package:flutter/cupertino.dart';

import '../utlis/constants.dart';

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String info;

  const CustomListTile({super.key, required this.icon, required this.info});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        spacing: 15,
        children: [
          Icon(icon, color: titleText, size: 30),

          Text(info, style: TextStyle(fontSize: 22, color: titleText)),
        ],
      ),
    );
  }
}
