import 'package:ecommrce/screens/home_screen.dart';
import 'package:ecommrce/screens/login_screen.dart';
import 'package:ecommrce/screens/register_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'loginScreen',
      routes: {
        'loginScreen' : (context) => LoginScreen(),
        'registerScreen' : (context) => RegisterScreen(),
        'homeScreen' : (context) => HomeScreen(),
      },
    );
  }
}


