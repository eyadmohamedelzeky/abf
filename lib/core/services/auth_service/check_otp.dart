import 'dart:developer';

import 'package:abf_ather/core/api/api_constants.dart';
import 'package:abf_ather/features/auth/model/check_otp_request.dart';
import 'package:abf_ather/features/auth/model/check_otp_response.dart';
import 'package:abf_ather/helper/dio_helper.dart';
class CheckOtpService {
  static Future<CheckOtpResponse> checkOtp(
      {required CheckOtpRequest request}) async {
    log("checkOtp request path: ${ApiConstants.checkOtp(request.email, request.otp)}");
    log("checkOtp request body: ${request.toJson()}");
    var response = await DioHelper.getData(
      path: ApiConstants.checkOtp(request.email, request.otp),
    );
    if (response!.statusCode == 200) {
      return CheckOtpResponse.fromJson(response.data);
    }
    throw Exception(response.data['message']);
  }
}
