import 'package:e_commerce/ui/utils/my_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: MyTheme.primaryLight,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(15.h),
          hintText: "What do you search for?",
          hintStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
              color: const Color.fromRGBO(6, 0, 79, 0.6)),
          prefixIcon: IconButton(
            icon: Icon(
              Icons.search,
              size: 32.sp,
              color: MyTheme.primaryLight,
            ),
            onPressed: () {},
          ),
          border: buildBaseBorder(),
          enabledBorder: buildBaseBorder(),
          focusedBorder: buildBaseBorder().copyWith(
              borderSide:
              const BorderSide(color: MyTheme.primaryLight, width: 2))),
    );
  }

  OutlineInputBorder buildBaseBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(50.r),
      borderSide: const BorderSide(color: MyTheme.primaryLight, width: 1),
    );
  }
}