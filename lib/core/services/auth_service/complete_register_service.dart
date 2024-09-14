import 'dart:developer';
import 'package:abf_ather/core/api/api_constants.dart';
import 'package:abf_ather/features/auth/model/complete_register_request.dart';
import 'package:abf_ather/features/auth/model/complete_register_response.dart';
import 'package:abf_ather/helper/dio_helper.dart';
import 'package:dio/dio.dart';

class CompleteRegisterService {
  static Future<CompleteRegisterResponse> completeRegisterProfile(
      {required CompleteRegisterRequest request}) async {
    log("CompleteRegisterRequest request path: ${ApiConstants.completeRegister}");
    log("CompleteRegisterRequest request body: ${request.toJson()}");
    var response = await DioHelper.postData(
        path: ApiConstants.completeRegister,
        data: FormData.fromMap({
          'f_name': request.fName,
          'l_name': request.lName,
          'phone': request.phone,
          'password': request.password,
          'password_confirmation': request.passwordConfirmation,
          'email': request.email,
          'otp': request.otp
        }));
    if (response!.statusCode == 200) {
      return CompleteRegisterResponse.fromJson(response.data);
    }
    throw Exception(response.data['errors']);
  }
}
