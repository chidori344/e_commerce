
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/cutome_text_forme_field.dart';
import '../../utils/my_theme.dart';
import '../login screen/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const routName = 'register screen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var ConfirmationPasswordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.transparent
    ,
      extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //
      //   centerTitle: true,
      // ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(60),
            child: Image.asset(
              'assets/images/app_iconw.png',
               alignment: AlignmentGeometry.topCenter,

            ),
            color: MyTheme.primaryLight,
            width: double.infinity,
            height: double.infinity,
          ),
          Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.31),
                  CutomeTextFormeField(
                    lable: "userName",
                    controller: nameController,
                    MyValidator: (text){
                      if(text==null || text.trim().isEmpty){
                        return "please enter your username";
                      }
                      return null;
                    },

                  ),
                  CutomeTextFormeField(
                    lable: "Email Address",
                    controller: emailController,
                    MyValidator: (text){
                      if(text==null || text.trim().isEmpty){
                        return "please enter your email";
                      }
                      bool emailValid =
                      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(text);
                      if (!emailValid) {
                        return 'please enter valid email';
                      }
                      return null;
                    },
                  ),
                  CutomeTextFormeField(lable: "Password",
                    controller: passwordController ,
                    MyValidator: (text){
                      if(text==null || text.trim().isEmpty){
                        return "please enter your password";
                      }
                      if(text.length<6){
                        return 'password shoulde be more thant 6 chars.';
                      }
                      return null;
                    },
                    isPassword: true,
                  ),
                  CutomeTextFormeField(lable: "Confirmation Password",
                    controller: ConfirmationPasswordController,
                    MyValidator: (text){
                      if(text==null || text.trim().isEmpty){
                        return "please enter Confirmation password";
                      }
                      if(text!=passwordController.text){
                        return 'password not match';
                      }

                      return null;
                    },
                    isPassword: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: (){
                            register();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyTheme.WhiteColor,
                        ) ,

                        child: Text('Register',
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: MyTheme.blackColor,
                          ),)
                    ),
                  ),
                  TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context, LoginScreen.routName);
                    },
                    child: Text('Already have an account?',
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: MyTheme.WhiteColor,)
                    ),

                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
void register() {}