

import 'package:e_commerce/ui/home_screen/tabs/profile_tab/Widgets/profile_headers.dart';
import 'package:e_commerce/ui/home_screen/tabs/profile_tab/Widgets/profile_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/custom_search-bar.dart';
import '../../../utils/my_assets.dart';
import '../../../utils/my_colors.dart';

class ProfileTabView extends StatelessWidget {
static const String routeName = 'ProfileTabView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child:Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Image.asset(
                      MyAssets.logo,
                    color: MyColors.primaryColor,
                  ),

                  SizedBox(
                    height: 16.h,
                  ),
                  ProfileHeaders(),
                  SizedBox(
                    height: 18.h,
                  ),
                  ProfileTextField(),
                  SizedBox(
                    height: 16.h,
                  ),


                ],
              ),
            ),
          ),
      ),
    );

  }
}
