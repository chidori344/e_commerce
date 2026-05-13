import 'package:bloc/bloc.dart';
import 'package:e_commerce/ui/auth/register%20screen/cubit/register_states.dart';
import 'package:flutter/cupertino.dart';

import '../../../../domain/use_case/register_usecase.dart';

class RegisterScreenViewModel extends Cubit<RegisterStates> {
  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var ConfirmationPasswordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  var PhoneController = TextEditingController();
  bool isPassword = true;
  RegisterUseCase registerUseCase;


  RegisterScreenViewModel({ required this.registerUseCase})
      :super(RegisterIntialState());

  /// hold data - handle logic
  void register() async {
    if (formKey.currentState!.validate() == true) {
      emit(RegisterLoadingState(loadingMassage: "loading"));
      var either = await registerUseCase.invoke(
          nameController.text, emailController.text,
          passwordController.text, ConfirmationPasswordController.text,
          PhoneController.text);
      either.fold((l) {
        if (l.errorMessage != null) {
          emit(RegisterErrorState(errorMassage: l.errorMessage));
      }
      }, (response) {

          emit(RegisterSuccessState(response: response));
      }
      );

    }
  }

}