import 'dart:ui';
import 'package:flutter/material.dart';

class MyTheme {
  static const Color primaryLight = Color(0xff004182);
  static Color WhiteColor = Color(0xffffffff);
  static Color redColor = Color(0xffC91C22);
  static Color darkBlueColor = Color(0xff003E90);
  static Color pinkColor = Color(0xffED1E79);
  static Color brownColor = Color(0xffCF7E48);
  static Color blueColor = Color(0xff4882CF);
  static Color yellowColor = Color(0xffF2D352);
  static Color greyColor = Color(0xff4F5F69);
  static Color blackColor = Color(0xff303030);

  static ThemeData LightTheme = ThemeData(
    primaryColor: primaryLight,
    appBarTheme: AppBarThemeData(
      backgroundColor: primaryLight,
      elevation: 0,
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),

    ),
    textTheme: TextTheme(
        titleLarge: TextStyle(
          color: WhiteColor,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          color: blackColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        )
    ),
  );
}
