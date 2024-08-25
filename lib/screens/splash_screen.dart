import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fitness_app/screens/login_screen.dart' ;

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2,
      milliseconds:3 ),
          () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(), // Ensures the container takes full space
        child: Image.asset(
          'assets/images/1.webp',
          fit: BoxFit.cover, // Adjust to control how the image scales
        ),
      ),
    );
  }
}
