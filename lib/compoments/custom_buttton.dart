import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utlis/constants.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
        onPressed: (){
          onPressed();
        },
        style: ButtonStyle(
            padding: WidgetStatePropertyAll(
              EdgeInsets.symmetric(
                vertical: 15,
              ),

            ),
            backgroundColor: WidgetStatePropertyAll(buttons),
            foregroundColor: WidgetStatePropertyAll(surface),
          overlayColor: WidgetStatePropertyAll(Colors.grey[800]!),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ));
  }
}