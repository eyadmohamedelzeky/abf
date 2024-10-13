import 'dart:developer';

import 'package:abf_ather/core/api/api_constants.dart';
import 'package:abf_ather/core/app_varaible/app_varabile.dart';
import 'package:abf_ather/features/business/model/business_respone_model.dart';
import 'package:abf_ather/helper/dio_helper.dart';

class GetBusinessService {
  static Future<BusinessResponseModel> getBusiness() async {
    log("business request path: ${ApiConstants.business}");
    var response = await DioHelper.getData(
      path: ApiConstants.business,
    );
    log('Token In business: ${userModel?.data?.token}');
    log("Response: ${response?.data}");

    if (response!.statusCode == 200) {
      return BusinessResponseModel.fromJson(response.data);
    }
    throw Exception(response.data['message'].toString());
  }
}
