import 'package:bloc/bloc.dart';
import 'package:e_commerce/ui/auth/login%20screen/login_screen.dart';
import 'package:e_commerce/ui/auth/register%20screen/register_screen.dart';
import 'package:e_commerce/ui/home_screen/home_screen_view.dart';
import 'package:e_commerce/ui/splash_screen/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc_observer.dart';

void main () {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title:'E_Commerce' ,
        initialRoute: HomeScreenView.routName,


        routes: {
          SplashScreen.routName: (context) => SplashScreen(),
          RegisterScreen.routName: (context) => RegisterScreen(),
          LoginScreen.routName: (context) => LoginScreen(),
          HomeScreenView.routName: (context) => HomeScreenView(),
        },

      ),
    );
  }


}