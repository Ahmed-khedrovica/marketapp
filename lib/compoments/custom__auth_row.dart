import 'package:flutter/material.dart';

import '../utlis/constants.dart';

class AuthRow extends StatelessWidget {
  final String label1 , label2;

  const AuthRow({super.key, required this.label1, required this.label2});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label1,
          style: TextStyle(fontSize: 20, color: bodyText),
        ),
        GestureDetector(
          onTap: (){
            if(label2 == 'Register now'){
              Navigator.pushReplacementNamed(context, 'registerScreen');
            }else{
              Navigator.pushReplacementNamed(context, 'loginScreen');
            }
          },
          child: Text(
            label2,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: Colors.blue,
              decoration: TextDecoration.underline,
              decorationColor: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
