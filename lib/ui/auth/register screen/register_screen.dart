import 'package:e_commerce/Data/repository/auth_repository/repository/auth_repository_impl.dart';
import 'package:e_commerce/ui/utils/dialog_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_case/register_usecase.dart';
import '../../utils/cutome_text_forme_field.dart';
import '../../utils/my_theme.dart';
import '../login screen/login_screen.dart';
import 'cubit/register-screen_view_model.dart';
import 'cubit/register_states.dart';

class RegisterScreen extends StatefulWidget {
  static const routName = 'register screen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterScreenViewModel viewModel = RegisterScreenViewModel(registerUseCase: injectRegisterUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterScreenViewModel, RegisterStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterLoadingState){
          DialogUtils.ShowLoading(context,state.loadingMassage??"");
        }
        if (state is RegisterErrorState) {
             DialogUtils.hideDialog(context);
             DialogUtils.showMassage(context, state.errorMassage??'',
             posActionName:'ok' );
        }
        if (state is RegisterSuccessState) {
          DialogUtils.showMassage(context, state.response?.userEntity.name??"",
              posActionName:'ok' );        }
          DialogUtils.hideDialog(context);

      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
              key: viewModel.formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.31),
                    CutomeTextFormeField(
                      lable: "userName",
                      controller: viewModel.nameController,
                      MyValidator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return "please enter your username";
                        }
                        return null;
                      },
                    ),
                    CutomeTextFormeField(
                      lable: "Email Address",
                      controller: viewModel.emailController,
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
                    ),
                    CutomeTextFormeField(
                      lable: "Password",
                      controller: viewModel.passwordController,
                      MyValidator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return "please enter your password";
                        }
                        if (text.length < 6) {
                          return 'password shoulde be more thant 6 chars.';
                        }
                        return null;
                      },
                      isPassword: true,
                    ),
                    CutomeTextFormeField(
                      lable: "Confirmation Password",
                      controller: viewModel.ConfirmationPasswordController,
                      MyValidator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return "please enter Confirmation password";
                        }
                        if (text != viewModel.passwordController.text) {
                          return 'password not match';
                        }

                        return null;
                      },
                      isPassword: true,
                    ),
                    CutomeTextFormeField(
                      lable: "phone number",
                      controller: viewModel.PhoneController,
                      MyValidator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return "sholud contain 12 numbers";
                        }

                        return null;
                      },
                      isPassword: true,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          viewModel.register();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyTheme.WhiteColor,
                        ),

                        child: Text(
                          'Register',
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(color: MyTheme.blackColor),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, LoginScreen.routName);
                      },
                      child: Text(
                        'Already have an account?',
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(color: MyTheme.WhiteColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void register() {}
