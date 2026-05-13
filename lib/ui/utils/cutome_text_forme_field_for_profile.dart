import 'package:e_commerce/ui/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'my_theme.dart';


typedef Validator= String? Function(String?);

class CutomeTextFormeFieldForProfile extends StatelessWidget {
String? lable="";
bool  isPassword ;
TextEditingController controller;
Validator MyValidator;
final Widget? suffixIcon;

TextInputType? KeyboardType;
CutomeTextFormeFieldForProfile({required this.lable,
this.KeyboardType=TextInputType.text,
this.isPassword=false,
  required this.controller,
  required this.MyValidator,
  this.suffixIcon, // 2. ADD THIS TO CONSTRUCTOR

});


  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(top: 9.0,bottom: 9.0),
      child: TextFormField(
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: MyTheme.primaryLight,
        ),

        cursorColor: MyColors.primaryColor.withOpacity(0.9),
        controller: controller,
        obscureText: isPassword,
        validator: MyValidator,
        keyboardType: KeyboardType,

        decoration: InputDecoration(

            suffixIcon: suffixIcon,
            label: Text(lable!,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: MyTheme.primaryLight,

            ),
            ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: MyTheme.primaryLight.withOpacity(0.4),
              width: 2
            )
          ),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                    color: MyTheme.primaryLight,
                    width: 4
                )
            ),
      focusedBorder:OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
              color: MyTheme.primaryLight,
              width: 4
          )
      )
        ),

      ),
    );
  }
}
