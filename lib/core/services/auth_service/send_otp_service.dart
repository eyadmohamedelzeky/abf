import 'dart:developer';

import 'package:abf_ather/core/api/api_constants.dart';
import 'package:abf_ather/features/auth/model/register_new_account_request.dart';
import 'package:abf_ather/features/auth/model/send_otp_response.dart';
import 'package:abf_ather/helper/dio_helper.dart';
class SendOtpService {
 static Future<SendOtpResponse> sendOtp(
      {required RegisterNewAccountRequest request}) async {
    log('send otp path request: ${ApiConstants.sendOtp(request.email)}');
    var response = await DioHelper.getData(
      path: ApiConstants.sendOtp(request.email),
    );
    if (response!.statusCode == 200) {
      return SendOtpResponse.fromJson(response.data);
    }
    throw Exception(response.data['message']);
  }
}
