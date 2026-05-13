import 'package:e_commerce/Data/model/response/register_response_dto.dart';

import '../../../../domain/entity/Auth_Result_Entity.dart';

abstract class RegisterStates {}
class RegisterIntialState extends RegisterStates{}
class RegisterLoadingState extends RegisterStates{
  String? loadingMassage;
  RegisterLoadingState({ this.loadingMassage});
}
class RegisterSuccessState extends RegisterStates{
  AuthResultEntity? response;
  RegisterSuccessState({required this.response});
}
class RegisterErrorState extends RegisterStates{
  String? errorMassage;
  RegisterErrorState({ this.errorMassage});
}
