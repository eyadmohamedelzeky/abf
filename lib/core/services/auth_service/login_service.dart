import 'dart:developer';
import 'package:abf_ather/core/api/api_constants.dart';
import 'package:abf_ather/features/auth/model/login_request_model.dart';
import 'package:abf_ather/features/auth/model/login_response_model.dart';
import 'package:abf_ather/helper/dio_helper.dart';
import 'package:dio/dio.dart';

class LoginApiService {
  static Future<LoginResponseModel> login(
      {required LoginRequestModel request}) async {
    log("login request path: ${ApiConstants.login}");
    log("login request body: ${request.toJson()}");
    var response = await DioHelper.postData(
        path: ApiConstants.login,
        data: FormData.fromMap({
          'email': request.email,
          'password': request.password,
        }));
    if (response!.statusCode == 200) {
      return LoginResponseModel.fromJson(response.data);
    }
    throw Exception(response.data['message']);
  }
}
