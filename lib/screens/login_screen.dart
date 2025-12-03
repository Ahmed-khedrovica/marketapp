import 'package:ecommrce/utlis/helper_functions.dart';
import 'package:flutter/material.dart';

import '../compoments/custom__auth_row.dart';
import '../compoments/custom_buttton.dart';
import '../compoments/custom_text_field.dart';
import '../utlis/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String error = '';
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();


    void onPressed() {
      if(emailController.text.isEmpty || passwordController.text.isEmpty){
        error = 'please fill all fields';
        setState(() {

        });
      }
      int status = login(emailController.text, passwordController.text);

      switch (status) {
        case 1:
          Navigator.pushReplacementNamed(context, 'HomeScreen');
        case 0:
          error = 'incorrect password';
          setState(() {});
        case -1:
          error = 'email not exist';
          setState(() {});
      }
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: padding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.lock, size: 80),
            Column(
              children: [
                CustomTextField(
                  controller: emailController,
                  text: 'Email',
                  icon: Icons.email,
                ),
                SizedBox(height: 25),
                CustomTextField(
                  controller: passwordController,
                  text: 'Password',
                  icon: Icons.password,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '  $error',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.red
                    ),
                  ),
                ),

                AuthRow(label1: 'Not a member ?  ', label2: 'Register now'),
              ],
            ),

            CustomButton(text: 'Login', onPressed: onPressed),
          ],
        ),
      ),
    );
  }
}
