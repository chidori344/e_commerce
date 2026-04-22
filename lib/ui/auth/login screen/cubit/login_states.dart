import 'package:e_commerce/Data/model/response/register_response_dto.dart';

import '../../../../domain/entity/Auth_Result_Entity.dart';

abstract class LoginStates {}
class LoginIntialState extends LoginStates{}
class LoginLoadingState extends LoginStates{
  String? loadingMassage;
  LoginLoadingState({ this.loadingMassage});
}
class LoginSuccessState extends LoginStates{
  AuthResultEntity? response;
  LoginSuccessState({required this.response});
}
class LoginErrorState extends LoginStates{
  String? errorMassage;
  LoginErrorState({ this.errorMassage});
}
