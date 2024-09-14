import 'dart:developer';
import 'package:abf_ather/core/api/api_constants.dart';
import 'package:abf_ather/features/auth/model/reset_password_request.dart';
import 'package:abf_ather/features/auth/model/reset_password_response.dart';
import 'package:abf_ather/helper/dio_helper.dart';
import 'package:dio/dio.dart';

class ResetPasswordService {
  static Future<ResetPasswordResponse> resetPassword({required ResetPasswordRequest request}) async {
    log("resetPassword request path: ${ApiConstants.resetPassword}");
    log("resetPassword request body: ${request.toJson()}");
    var response = await DioHelper.postData(
      path: ApiConstants.resetPassword,
      data: FormData.fromMap(
        {
          'email': request.email,
          'password': request.password,
          'password_confirmation': request.passwordConfirmation,
          'otp':request.otp

        },
      ),
    );
    if (response!.statusCode == 200) {
      return ResetPasswordResponse.fromJson(response.data);
    }
    throw Exception(response.data['message']); 
  }


}