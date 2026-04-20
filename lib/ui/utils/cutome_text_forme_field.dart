import 'package:flutter/material.dart';
import 'my_theme.dart';


typedef Validator= String? Function(String?);

class CutomeTextFormeField extends StatelessWidget {
String? lable="";
bool  isPassword ;
TextEditingController controller;
Validator MyValidator;
final Widget? suffixIcon;

TextInputType? KeyboardType;
CutomeTextFormeField({required this.lable,
this.KeyboardType=TextInputType.text,
this.isPassword=false,
  required this.controller,
  required this.MyValidator,
  this.suffixIcon, // 2. ADD THIS TO CONSTRUCTOR

});


  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: MyTheme.WhiteColor,
        ),

        cursorColor: MyTheme.WhiteColor,
        controller: controller,
        obscureText: isPassword,
        validator: MyValidator,
        keyboardType: KeyboardType,

        decoration: InputDecoration(

            suffixIcon: suffixIcon,
            label: Text(lable!,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: MyTheme.WhiteColor,

            ),
            ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: MyTheme.WhiteColor,
              width: 4
            )
          ),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                    color: MyTheme.WhiteColor,
                    width: 4
                )
            ),
      focusedBorder:OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
              color: MyTheme.WhiteColor,
              width: 4
          )
      )
        ),

      ),
    );
  }
}
