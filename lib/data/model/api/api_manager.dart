import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/data/model/api/api_constants.dart';
import 'package:ecommerceapp/data/model/request/LoginRequest.dart';
import 'package:ecommerceapp/data/model/request/RegisterRequest.dart';
import 'package:ecommerceapp/data/model/response/LoginResponeDto.dart';
import 'package:ecommerceapp/data/model/response/RegisterResponeDto.dart';
import 'package:ecommerceapp/domain/failures.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';

class ApiManager {
  ApiManager._();

  static ApiManager? _instance;

  static ApiManager getinstance() {
    _instance ??= ApiManager._();
    return _instance!;
  }

/* https://ecommerce.routemisr.com/api/v1/auth/signup  */
  Future<Either<Faliures, RegisterResponeDto>> register(String name,
      String email, String password, String rePassword, String phone) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.registerApi);
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network.
      var registerBody = RegisterRequest(
          name: name,
          email: email,
          rePassword: rePassword,
          password: password,
          phone: phone);
      var respone = await http.post(url, body: registerBody.toJson());
      var registerResponse =
          RegisterResponeDto.fromJson(jsonDecode(respone.body));
      if (respone.statusCode >= 200 && respone.statusCode < 300) {
        return Right(registerResponse);
      } else {
        return Left(ServerError(
            errorMessage: registerResponse.error != null
                ? registerResponse.error!.msg!
                : registerResponse.message ?? ""));
      }
    } else {
      return left(
          NetworkError(errorMessage: 'please check ur internet connection'));
    }
  }

  Future<Either<Faliures, LoginResponeDto>> login(
      String email, String password) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.loginApi);
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network.
      var loginBody = LoginRequest(email: email, password: password);
      var respone = await http.post(url, body: loginBody.toJson());
      var LoginResponse = LoginResponeDto.fromJson(jsonDecode(respone.body));
      if (respone.statusCode >= 200 && respone.statusCode < 300) {
        return Right(LoginResponse);
      } else {
        return Left(ServerError(errorMessage: LoginResponse.message ?? ""));
      }
    } else {
      return left(
          NetworkError(errorMessage: 'please check ur internet connection'));
    }
  }
}
