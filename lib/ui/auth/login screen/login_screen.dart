import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../domain/di.dart';
import '../../utils/cutome_text_forme_field.dart';
import '../../utils/dialog_utils.dart';
import '../../utils/my_theme.dart';
import '../register screen/register_screen.dart';
import 'cubit/login-screen_view_model.dart';
import 'cubit/login_states.dart';

class LoginScreen extends StatefulWidget {
  static const routName = 'login screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
LoginScreenViewModel viewModel = LoginScreenViewModel(loginUseCase: injectLoginUseCase());


  @override
  Widget build(BuildContext context) {



    return BlocListener<LoginScreenViewModel, LoginStates>(
        bloc: viewModel,
        listener: (context, state) {
          if (state is LoginLoadingState){
            DialogUtils.ShowLoading(context,state.loadingMassage??"");
          }
          if (state is LoginErrorState) {
            DialogUtils.hideDialog(context);
            DialogUtils.showMassage(context, state.errorMassage??'',
                posActionName:'ok' );
          }
          if (state is LoginSuccessState) {
            DialogUtils.hideDialog(context);
            DialogUtils.showMassage(context, state.response?.userEntity.name??"",
                posActionName:'ok',

            );
          }


        },
        child: Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
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
            key: viewModel.formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                  CutomeTextFormeField(
                    lable: "Email Address",
                    controller: viewModel.emailController,
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
                    controller: viewModel.passwordController ,
                    MyValidator: (text){
                      if(text==null || text.trim().isEmpty){
                        return "please enter your password";
                      }
                      if(text.length<6){
                        return 'password shoulde be more thant 6 chars.';
                      }
                      return null;
                    },
                    KeyboardType: TextInputType.visiblePassword,
                    isPassword: viewModel.isPassword,
                    suffixIcon: InkWell(
                      child: viewModel.isPassword
                          ? Icon(Icons.visibility_off,color: MyTheme.WhiteColor)
                          : Icon(Icons.visibility,color: MyTheme.WhiteColor),
                        onTap: () {
                          setState(() {
                            viewModel.isPassword = !viewModel.isPassword;
                          });
                        },

                    ),
                  ),
                  SizedBox(height:MediaQuery.of(context).size.height*0.09) ,

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                          onPressed: (){
                            viewModel.login();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: MyTheme.WhiteColor,
                          ) ,

                          child: Text('Login',
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: MyTheme.blackColor,
                            ),)
                      ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?",
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: MyTheme.WhiteColor,
                        ),
                      ),
                      TextButton(
                        onPressed: (){
                          Navigator.pushNamed(context, RegisterScreen.routName);
                        },
                        child: Text('Sign Up',
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              color:MyTheme.WhiteColor)
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
    )
    );
    }
}
void Login() {
  return null;}
