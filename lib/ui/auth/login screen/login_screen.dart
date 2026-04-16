import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../utils/cutome_text_forme_field.dart';
import '../../utils/my_theme.dart';
import '../register screen/register_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routName = 'login screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Todo App',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Image.asset(
            'assetes/images/background.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.3),
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: (){
                          Login();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                        ) ,

                        child: Text('Login',
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: MyTheme.WhiteColor,
                          ),)
                    ),
                  ),
                  SizedBox(height:MediaQuery.of(context).size.height*0.02) ,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?",
                        style: Theme.of(context).textTheme.titleMedium!,
                      ),
                      TextButton(
                        onPressed: (){
                          Navigator.pushNamed(context, RegisterScreen.routName);
                        },
                        child: Text('Sign Up',
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: Theme.of(context).primaryColor,)
                        ),

                      ),

                    ],
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
void Login() {
  return null;}