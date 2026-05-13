


import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../tabs/FavoriteTab.dart';
import '../tabs/home_tab.dart';
import '../tabs/product_list/product_list_view.dart';
import '../tabs/profile_tab/profile_tab_view.dart';
import 'home_screen_states.dart';

class HomeScreenViewModel extends Cubit<HomeScreenStates>{
  HomeScreenViewModel():super(HomeIntialState());
    int selectedIndex = 0;
    List<Widget> tabs=[
      HomeTap(),
      productListTab(),
      Favoritetab(),
      ProfileTabView(),
    ];

void ChangeButtomNavIndex(int newSelectedindex){
  emit (HomeIntialState());
selectedIndex=newSelectedindex;
emit(HomeChangeBottomNavBar());


}

}