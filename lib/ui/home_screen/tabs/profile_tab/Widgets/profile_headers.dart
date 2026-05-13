import 'package:e_commerce/domain/entity/Auth_Result_Entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../auth/login screen/login_screen.dart';
import '../../../../utils/my_assets.dart';
import '../../../../utils/my_theme.dart';
import '../../../../utils/shared_preference_Utils.dart';

class ProfileHeaders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            "Welcome user name \nuser email",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: MyTheme.primaryLight,
            ),
          ),
        ),
        SizedBox(width: 24.w),
        InkWell(
          onTap: () {
            SahredPreferenceUtils.removeData(key: "Token");
            Navigator.pushReplacementNamed(context, LoginScreen.routName);
          },
          child: Icon(Icons.logout, size: 28.sp, color: MyTheme.primaryLight),
        ),
      ],
    );
  }
}
