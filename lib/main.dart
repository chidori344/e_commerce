import 'package:bloc/bloc.dart';
import 'package:e_commerce/ui/auth/login%20screen/login_screen.dart';
import 'package:e_commerce/ui/auth/register%20screen/register_screen.dart';
import 'package:e_commerce/ui/cart/cart_view.dart';
import 'package:e_commerce/ui/home_screen/home_screen_view.dart';
import 'package:e_commerce/ui/home_screen/tabs/product_details/product_details_view.dart';
import 'package:e_commerce/ui/home_screen/tabs/profile_tab/profile_tab_view.dart';
import 'package:e_commerce/ui/splash_screen/splash_screen.dart';
import 'package:e_commerce/ui/utils/shared_preference_Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc_observer.dart';

void main () async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await SahredPreferenceUtils.init();
  String? route;
  var user =SahredPreferenceUtils.getData(key: "Token");
  if(user == null){
    route =LoginScreen.routName;
  }else{
    route =HomeScreenView.routName;
  }
  runApp(MyApp(route));
}

class MyApp extends StatelessWidget {
  String? route;
  MyApp(this.route);

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title:'E_Commerce' ,
        initialRoute: route,


        routes: {
          SplashScreen.routName: (context) => SplashScreen(),
          RegisterScreen.routName: (context) => RegisterScreen(),
          LoginScreen.routName: (context) => LoginScreen(),
          HomeScreenView.routName: (context) => HomeScreenView(),
          ProductDetailsView.routeName: (context) => ProductDetailsView(),
          CartView.routeName: (context) => CartView(),
        },

      ),
    );
  }


}