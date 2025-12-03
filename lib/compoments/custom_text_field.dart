import 'package:flutter/material.dart';

import '../utlis/constants.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final IconData icon;

  const CustomTextField({super.key, required this.controller, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: text == 'Password' ? true : false,
      controller: controller,
      decoration: InputDecoration(
        labelText: text,
        labelStyle: TextStyle(
          color: bodyText,
          fontSize: 18,
        ),
        suffixIcon: Icon(icon,
          color: icons,),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: surface,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: surface,
          ),
        ),
        fillColor: surface,
        filled: true,
      ),
      style: TextStyle(color: bodyText, fontSize: 22),

    );
  }
}