import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../tabs/favorite_tab.dart';
import '../tabs/home_tab.dart';
import '../tabs/product_list_tab.dart';
import '../tabs/profile_tab.dart';
import 'home_screen_states.dart';

class HomeScreenViewModel extends Cubit<HomeStates>{
  HomeScreenViewModel():super(HomeIntialState());
    int selectedIndex = 0;
    List<Widget> tabs=[
      HomeTab(),
      ProductListTab(),
      FavouriteTabScreenView(),
      ProfileTab(),
    ];

void ChangeButtomNavIndex(int newSelectedindex){
selectedIndex=newSelectedindex;
emit(HomeChangeBottomNavBar());


}

}