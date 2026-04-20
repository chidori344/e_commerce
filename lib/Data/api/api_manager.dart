import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/Data/api/api_constance.dart';
import 'package:http/http.dart' as http;

import '../../domain/entity/failures.dart';
import '../model/request/register_request.dart';
import '../model/response/register_response_dto.dart';

class ApiManager {
  ApiManager._();
  static ApiManager? _instance;
  static ApiManager getInstance() {
    _instance ??= ApiManager._();
    return _instance!;
  }


  /*
  https://ecommerce.routemisr.com/api/v1/auth/signup
*/
 Future<Either<Failures,RegisterResponseDto>> register  (
    String? name, String? email, String? password,
    String? rePassword, String? phone) async {

   final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());

// This condition is for demo purposes only to explain every connection type.
// Use conditions which work for your requirements.
   if (
   connectivityResult.contains(ConnectivityResult.mobile) ||
       connectivityResult.contains(ConnectivityResult.wifi)) {
     // wifi or Mobile network available.
     Uri url= Uri.https(ApiConstance.baseUrl, ApiConstance.registerApi);

     var requestBody = RegisterRequest (
         name: name,
         email: email,
         password: password,
         rePassword: rePassword,
         phone: phone
     );
       var response = await http.post(url, body: requestBody.toJson() );
       print("Response Body: ${response.body}");

       var registerResponse = RegisterResponseDto.fromJson(jsonDecode(response.body));
       if(response.statusCode >= 200 && response.statusCode < 300) {
         return Right(registerResponse);
       }else{
         return Left(Failures(errorMessage: registerResponse.error!=null?
              registerResponse.error!.msg
             :registerResponse.message));
       }


   } else {
     // no internet connection
     return Left(Failures(errorMessage: 'Check internetconnections'));

   }
  }
}
