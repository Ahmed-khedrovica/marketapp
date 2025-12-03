import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommrce/compoments/custom_buttton.dart';
import 'package:ecommrce/compoments/custom_title.dart';
import 'package:ecommrce/utlis/constants.dart';
import 'package:flutter/material.dart';

import 'custom_list_tile.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          CustomTitle(title: 'Profile'),
          Center(
            child: CircleAvatar(
              radius: 40,
              backgroundImage: CachedNetworkImageProvider(
                'https://th.bing.com/th/id/R.69b6c7c1419fedc585d4aac2958c5ae4?rik=Ti4lNMU9Co54jg&pid=ImgRaw&r=0',
              ),
            ),
          ),
          CustomListTile(icon: Icons.person, info: currentUser.userName),
          CustomListTile(icon: Icons.email, info: currentUser.email),
          CustomListTile(icon: Icons.password, info: '*'.padLeft(currentUser.password.length, '*')),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: CustomButton(text: 'Logout', onPressed: () {
              Navigator.pushReplacementNamed(context, 'loginScreen');

            }),
          )
        ],
      ),
    );
  }
}

