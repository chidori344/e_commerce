import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/Data/api/api_constance.dart';
import 'package:e_commerce/Data/model/response/get_cart_response_dto.dart';
import 'package:http/http.dart' as http;

import '../../domain/entity/failures.dart';
import '../../ui/utils/shared_preference_Utils.dart';
import '../model/request/login_request.dart';
import '../model/request/register_request.dart';
import '../model/response/add__to_cart_respose_dto.dart';
import '../model/response/category_response_dto.dart';
import '../model/response/login_response_dto.dart';
import '../model/response/product_response_dto.dart';
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
  Future<Either<Failures, RegisterResponseDto>> register(
    String? name,
    String? email,
    String? password,
    String? rePassword,
    String? phone,
  ) async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());

    // This condition is for demo purposes only to explain every connection type.
    // Use conditions which work for your requirements.
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      // wifi or Mobile network available.
      Uri url = Uri.https(ApiConstance.baseUrl, ApiConstance.registerApi);

      var requestBody = RegisterRequest(
        name: name,
        email: email,
        password: password,
        rePassword: rePassword,
        phone: phone,
      );
      var response = await http.post(url, body: requestBody.toJson());
      print("Response Body: ${response.body}");

      var registerResponse = RegisterResponseDto.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(registerResponse);
      } else {
        return Left(
          Failures(
            errorMessage: registerResponse.error != null
                ? registerResponse.error!.msg
                : registerResponse.message,
          ),
        );
      }
    } else {
      // no internet connection
      return Left(Failures(errorMessage: 'Check internetconnections'));
    }
  }

  Future<Either<Failures, LoginResponseDto>> login(
    String? email,
    String? password,
  ) async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());

    // This condition is for demo purposes only to explain every connection type.
    // Use conditions which work for your requirements.
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      // wifi or Mobile network available.
      Uri url = Uri.https(ApiConstance.baseUrl, ApiConstance.loginApi);

      var requestBody = LoginRequest(email: email, password: password);
      var response = await http.post(url, body: requestBody.toJson());
      print("Response Body: ${response.body}");

      var loginResponse = LoginResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(loginResponse);
      } else {
        return Left(
          Failures(
            errorMessage: loginResponse.message != null
                ? loginResponse.message!
                : loginResponse.message,
          ),
        );
      }
    } else {
      // no internet connection
      return Left(Failures(errorMessage: 'Check internetconnections'));
    }
  }

  Future<Either<Failures, CategoryOrBrandResponseDto>>
  getAllCategories() async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());

    // This condition is for demo purposes only to explain every connection type.
    // Use conditions which work for your requirements.
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      // wifi or Mobile network available.
      Uri url = Uri.https(
        ApiConstance.baseUrl,
        ApiConstance.getAllCategoriesApi,
      );

      var response = await http.get(url);
      print("Response Body: ${response.body}");

      var categoryResponse = CategoryOrBrandResponseDto.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(categoryResponse);
      } else {
        return Left(
          Failures(
            errorMessage: categoryResponse.message != null
                ? categoryResponse.message!
                : categoryResponse.message,
          ),
        );
      }
    } else {
      // no internet connection
      return Left(Failures(errorMessage: 'Check internetconnections'));
    }
  }

  Future<Either<Failures, CategoryOrBrandResponseDto>> getAllBrands() async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());

    // This condition is for demo purposes only to explain every connection type.
    // Use conditions which work for your requirements.
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      // wifi or Mobile network available.
      Uri url = Uri.https(ApiConstance.baseUrl, ApiConstance.getAllBrandsApi);

      var response = await http.get(url);
      print("Response Body: ${response.body}");

      var categoryOrBrandResponse = CategoryOrBrandResponseDto.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(categoryOrBrandResponse);
      } else {
        return Left(
          Failures(
            errorMessage: categoryOrBrandResponse.message != null
                ? categoryOrBrandResponse.message!
                : categoryOrBrandResponse.message,
          ),
        );
      }
    } else {
      // no internet connection
      return Left(Failures(errorMessage: 'Check internetconnections'));
    }
  }

  Future<Either<Failures, ProductResponseDto>> getAllProducts() async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());

    // This condition is for demo purposes only to explain every connection type.
    // Use conditions which work for your requirements.
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      // wifi or Mobile network available.
      Uri url = Uri.https(ApiConstance.baseUrl, ApiConstance.getAllProductsApi);

      var response = await http.get(url);
      print("Response Body: ${response.body}");

      var productResponse = ProductResponseDto.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(productResponse);
      } else {
        return Left(
          Failures(
            errorMessage: productResponse.message != null
                ? productResponse.message!
                : productResponse.message,
          ),
        );
      }
    } else {
      // no internet connection
      return Left(Failures(errorMessage: 'Check internetconnections'));
    }
  }
  Future<Either<Failures, AddToCartResposeDto>> addToCart(String productId) async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());

    // This condition is for demo purposes only to explain every connection type.
    // Use conditions which work for your requirements.
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      // wifi or Mobile network available.
      var token = await SahredPreferenceUtils.getData(key: 'Token');
      Uri url = Uri.https(ApiConstance.baseUrl, ApiConstance.addToCartApi);

      var response = await http.post(url, body: {
        'productId': productId
      },
        headers: {
        'token': token.toString(),
        }
      );
      print("Response Body: ${response.body}");

      var addToCartResponse = AddToCartResposeDto.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(addToCartResponse);
      }else if(response.statusCode == 401){
        return Left(Failures(errorMessage: addToCartResponse.message));

      }
      else {
        return Left(
          Failures(
            errorMessage: addToCartResponse.message != null
                ? addToCartResponse.message!
                : addToCartResponse.message,
          ),
        );
      }
    } else {
      // no internet connection
      return Left(Failures(errorMessage: 'Check internetconnections'));
    }
  }
  Future<Either<Failures, GetCartResponseDto>> getCart() async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());

    // This condition is for demo purposes only to explain every connection type.
    // Use conditions which work for your requirements.
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      // wifi or Mobile network available.
      var token = await SahredPreferenceUtils.getData(key: 'Token');
      Uri url = Uri.https(ApiConstance.baseUrl, ApiConstance.addToCartApi);

      var response = await http.get(url,
        headers: {
        'token': token.toString(),
        }
      );
      print("Response Body: ${response.body}");

      var getCartResponse = GetCartResponseDto.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(getCartResponse);
      }else if(response.statusCode == 401){
        return Left(Failures(errorMessage: getCartResponse.message));

      }
      else {
        return Left(
          Failures(
            errorMessage: getCartResponse.message != null
                ? getCartResponse.message!
                : getCartResponse.message,
          ),
        );
      }
    } else {
      // no internet connection
      return Left(Failures(errorMessage: 'Check internetconnections'));
    }
  }
  Future<Either<Failures, GetCartResponseDto>> deleteItemInCart(String productId) async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());

    // This condition is for demo purposes only to explain every connection type.
    // Use conditions which work for your requirements.
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      // wifi or Mobile network available.
      var token = await SahredPreferenceUtils.getData(key: 'Token');
      Uri url = Uri.https(ApiConstance.baseUrl, "${ApiConstance.addToCartApi}/$productId");

      var response = await http.delete(url,
        headers: {
        'token': token.toString(),
        }
      );
      print("Response Body: ${response.body}");

      var deleteCartResponse = GetCartResponseDto.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(deleteCartResponse);
      }else if(response.statusCode == 401){
        return Left(Failures(errorMessage: deleteCartResponse.message));

      }
      else {
        return Left(
          Failures(
            errorMessage: deleteCartResponse.message != null
                ? deleteCartResponse.message!
                : deleteCartResponse.message,
          ),
        );
      }
    } else {
      // no internet connection
      return Left(Failures(errorMessage: 'Check internetconnections'));
    }
  }
  Future<Either<Failures, GetCartResponseDto>> UpdateCountInCart(String productId, int Count) async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());

    // This condition is for demo purposes only to explain every connection type.
    // Use conditions which work for your requirements.
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      // wifi or Mobile network available.
      var token = await SahredPreferenceUtils.getData(key: 'Token');
      Uri url = Uri.https(ApiConstance.baseUrl, "${ApiConstance.addToCartApi}/$productId");

      var response = await http.put(url,
        headers: {
        'token': token.toString(),
        },
        body: {
          'count': Count.toString(),
        }
      );
      print("Response Body: ${response.body}");

      var updateCartResponse = GetCartResponseDto.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(updateCartResponse);
      }else if(response.statusCode == 401){
        return Left(Failures(errorMessage: updateCartResponse.message));

      }
      else {
        return Left(
          Failures(
            errorMessage: updateCartResponse.message != null
                ? updateCartResponse.message!
                : updateCartResponse.message,
          ),
        );
      }
    } else {
      // no internet connection
      return Left(Failures(errorMessage: 'Check internetconnections'));
    }
  }

}
