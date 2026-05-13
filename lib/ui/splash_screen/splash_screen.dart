import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../auth/register screen/register_screen.dart';

class SplashScreen extends StatefulWidget {
  static const routName = "splash_screen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // 3 seconds is usually plenty!
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, RegisterScreen.routName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        'assets/images/Splash_Screen.png', // Double-check this matches your file name!
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
