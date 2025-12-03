import 'package:flutter/material.dart';

import '../compoments/custom__auth_row.dart';
import '../compoments/custom_buttton.dart';
import '../compoments/custom_text_field.dart';
import '../utlis/constants.dart';
import '../utlis/helper_functions.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String error = '';
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController userNameController = TextEditingController();


    void onPressed() {
      if(emailController.text.isEmpty || passwordController.text.isEmpty ||
      userNameController.text.isEmpty
      ){
        error = 'please fill all fields';
        setState(() {

        });
      }
      bool status = register(
        userNameController.text,
        emailController.text,
        passwordController.text,
      );

      switch (status) {
        case true:
          Navigator.pushReplacementNamed(context, 'homeScreen');
        case false:
          {
            error = 'email is already exist';
            setState(() {});
          }
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
                  controller: userNameController,
                  text: 'UserName',
                  icon: Icons.person,
                ),
                SizedBox(height: 25),
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
                SizedBox(height: 10,),
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
                SizedBox(height: 40,),
                AuthRow(
                  label1: 'Already have an account ',
                  label2: 'Login now',
                ),
              ],
            ),

            CustomButton(text: 'Register', onPressed: onPressed),
          ],
        ),
      ),
    );
  }
}
