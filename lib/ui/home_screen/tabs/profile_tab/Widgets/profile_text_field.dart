import 'package:e_commerce/ui/utils/my_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/cutome_text_forme_field_for_profile.dart';

class ProfileTextField extends StatelessWidget {
 ProfileTextField({super.key}) ;


  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var ConfirmationPasswordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  var PhoneController = TextEditingController();
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {

    return Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CutomeTextFormeFieldForProfile(

              lable: "userName",
              controller: nameController,
              MyValidator: (text) {
                if (text == null || text.trim().isEmpty) {
                  return "please enter your username";
                }
                return null;
              },
              suffixIcon: InkWell(
                  child: Icon(Icons.edit,color: MyColors.primaryColor),
                  onTap: () {
                    //editing
                  },

              ),

            ),
            CutomeTextFormeFieldForProfile(
              lable: "Email Address",
              controller: emailController,
              MyValidator: (text) {
                if (text == null || text.trim().isEmpty) {
                  return "please enter your email";
                }
                bool emailValid = RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                ).hasMatch(text);
                if (!emailValid) {
                  return 'please enter valid email';
                }
                return null;
              },
              suffixIcon: InkWell(
                child: Icon(Icons.edit,color: MyColors.primaryColor),
                onTap: () {
                  //editing
                },

              ),
            ),
            CutomeTextFormeFieldForProfile(
              lable: "Password",
              controller: passwordController,
              MyValidator: (text) {
                if (text == null || text.trim().isEmpty) {
                  return "please enter your password";
                }
                if (text.length < 6) {
                  return 'password shoulde be more thant 6 chars.';
                }
                return null;
              },
              suffixIcon: InkWell(
                child: Icon(Icons.edit,color: MyColors.primaryColor),
                onTap: () {
                  //editing
                },

              ),
              isPassword: true,
            ),
            CutomeTextFormeFieldForProfile(
              lable: "phone number",
              controller: PhoneController,
              MyValidator: (text) {
                if (text == null || text.trim().isEmpty) {
                  return "sholud contain 12 numbers";
                }

                return null;
              },
              suffixIcon: InkWell(
                child: Icon(Icons.edit,color: MyColors.primaryColor),
                onTap: () {
                  //editing
                },

              ),
              isPassword: true,
            ),
            CutomeTextFormeFieldForProfile(
              lable: "your address",
              controller: ConfirmationPasswordController,
              MyValidator: (text) {
                if (text == null || text.trim().isEmpty) {
                  return "please enter your address";
                }
                return null;
              },
              suffixIcon: InkWell(
                child: Icon(Icons.edit,color: MyColors.primaryColor),
                onTap: () {
                  //editing
                },

              ),
            ),



          ],
        ),
      );
  }

}