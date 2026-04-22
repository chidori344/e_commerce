import 'package:e_commerce/ui/home_screen/cubit/home_screen_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/custom_bottom_navigation_bar.dart';
import 'cubit/home_screen_states.dart';

class HomeScreenView extends StatelessWidget {
  static const String routName = "HomeScreen";
  HomeScreenViewModel viewModel = HomeScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenViewModel, HomeStates>(
      bloc: viewModel,
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          bottomNavigationBar: buildCustomBottomNavigationBar(
            context: context,
            selectedIndex: viewModel.selectedIndex,
            onTapFunction: (index) {
              viewModel.ChangeButtomNavIndex(index);
            },
          ),
          body: viewModel.tabs[viewModel.selectedIndex],
        );
      },
    );
  }
}
