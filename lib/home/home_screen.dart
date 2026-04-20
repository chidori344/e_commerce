import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const  String routName = "HomeScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(color: Colors.blue,
        width: double.infinity,
        height: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

          ],
        ),
      ),

    );
  }
}
