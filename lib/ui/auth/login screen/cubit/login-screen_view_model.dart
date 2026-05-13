import 'package:bloc/bloc.dart';
import 'package:e_commerce/domain/entity/failures.dart';
import 'package:e_commerce/ui/auth/login%20screen/cubit/login_states.dart';
import 'package:flutter/cupertino.dart';

import '../../../../domain/use_case/login_usecase.dart';
class LoginScreenViewModel extends Cubit<LoginStates> {

  var emailController = TextEditingController();

  var passwordController = TextEditingController();


  var formKey = GlobalKey<FormState>();
  bool isPassword = true;
  LoginUseCase loginUseCase;


  LoginScreenViewModel({ required this.loginUseCase})
      :super(LoginIntialState());

  /// hold data - handle logic
  void login() async {
    if (formKey.currentState!.validate() == true) {
      emit(LoginLoadingState(loadingMassage: "loading"));
      var either = await loginUseCase.invoke(
          emailController.text,
          passwordController.text);
      either.fold((l) {
         {
          emit(LoginErrorState(errorMassage: Failures(errorMessage: l.errorMessage).errorMessage));
      }
      }, (response) {

          emit(LoginSuccessState(response: response));
      }
      );

    }
  }

}