import 'dart:developer';
import 'package:abf_ather/core/api/api_constants.dart';
import 'package:abf_ather/features/auth/model/register_new_account_request.dart';
import 'package:abf_ather/features/auth/model/register_new_account_response.dart';
import 'package:abf_ather/helper/dio_helper.dart';
import 'package:dio/dio.dart';

class RegisterApiService {
  static Future<RegisterNewAccountResponse> register(
      {required RegisterNewAccountRequest request}) async {
    log("register request path: ${ApiConstants.register}");
    log("register request body: ${request.toJson()}");
    var response = await DioHelper.postData(
      path: ApiConstants.register,
      data: FormData.fromMap(
        {
          'email': request.email,
        },
      ),
    );
    if (response!.statusCode == 200) {
      return RegisterNewAccountResponse.fromJson(response.data);
    }
    throw Exception(response.data['message']);
  }
}
