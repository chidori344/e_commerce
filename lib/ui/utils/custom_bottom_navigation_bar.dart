import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'my_assets.dart';
import 'my_theme.dart';

Widget buildCustomBottomNavigationBar({
  required int selectedIndex,
  required Function(int) onTapFunction,
  required BuildContext context,
}) {
  return Theme(
  data: Theme.of(context).copyWith(
    // This removes the "white tap" ripple effect
    splashColor: Colors.transparent,
    // This removes the greyish background highlight when held
    highlightColor: Colors.transparent,
  ),
    child: ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.r),
        topRight: Radius.circular(20.r),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: MyTheme.primaryLight,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: (0),
    
    
        currentIndex: selectedIndex,
        onTap: onTapFunction,
        items: [
          BottomNavigationBarItem(
      label: "Home",
            icon: CircleAvatar(
              foregroundColor: selectedIndex == 0 ? MyTheme.primaryLight : Colors.white,
              backgroundColor: selectedIndex == 0 ? MyTheme.WhiteColor : Colors.transparent,
              radius: 20.r,
              child: ImageIcon(
                AssetImage(MyAssets.notSelectedHomeIcon),
                size: 40.sp,
              ),
            ),
    
          ),
          BottomNavigationBarItem(
            label: "select catigory ",
            icon: CircleAvatar(
              foregroundColor: selectedIndex == 1 ? MyTheme.primaryLight : Colors.white,
              backgroundColor: selectedIndex == 1 ? MyTheme.WhiteColor : Colors.transparent,
              radius: 20.r,
              child: ImageIcon(
                AssetImage(MyAssets.notSelectedCategoryIcon),
                size: 40.sp,
              ),
            ),
    
          ),
          BottomNavigationBarItem(
            label: "wish list",
            icon: CircleAvatar(
              foregroundColor: selectedIndex == 2 ? MyTheme.primaryLight : Colors.white,
              backgroundColor: selectedIndex == 2 ? MyTheme.WhiteColor : Colors.transparent,
              radius: 20.r,
              child: ImageIcon(
                AssetImage(MyAssets.notSelectedWishlistIcon),
                size: 40.sp,
              ),
            ),
    
          ),
          BottomNavigationBarItem(
            label: "accunt",
            icon: CircleAvatar(
              foregroundColor: selectedIndex == 3 ? MyTheme.primaryLight : Colors.white,
              backgroundColor: selectedIndex == 3 ? MyTheme.WhiteColor : Colors.transparent,
              radius: 20.r,
              child: ImageIcon(
                AssetImage(MyAssets.notSelectedAccountIcon),
                size: 40.sp,
              ),
            ),
    
          ),
    
        ],
      ),
    ),
  );
}
