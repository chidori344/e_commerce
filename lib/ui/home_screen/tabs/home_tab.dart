import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  static const  String routName = "home tab";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Expanded(
        child: Container(color: Colors.blue,
          width: double.infinity,
          height: double.infinity,
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
        
            ],
          ),
        ),
      ),

    );
  }
}
