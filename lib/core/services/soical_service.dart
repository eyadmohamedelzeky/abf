import 'dart:developer';

import 'package:abf_ather/core/api/api_constants.dart';
import 'package:abf_ather/core/app_varaible/app_varabile.dart';
import 'package:abf_ather/features/home/model/soical_response_model.dart';
import 'package:abf_ather/helper/dio_helper.dart';

class SoicalService {
    static Future<SoicalResponseModel> getAllSoical() async {
    log("getAllSoical request path: ${ApiConstants.soical}");

    var response = await DioHelper.getData(
      path: ApiConstants.soical,
    );

    log('Token In soical: ${userModel?.data?.token}');
    log("Response: ${response?.data}");

    if (response!.statusCode == 200) {
      return SoicalResponseModel.fromJson(response.data);

     
    }
    throw Exception(response.data['message'].toString());
  }
}