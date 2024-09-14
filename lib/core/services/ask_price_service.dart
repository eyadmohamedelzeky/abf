import 'dart:developer';
import 'package:abf_ather/core/api/api_constants.dart';
import 'package:abf_ather/features/ask_price_feature/model/ask_price_request.dart';
import 'package:abf_ather/features/ask_price_feature/model/ask_price_response.dart';
import 'package:abf_ather/features/ask_price_feature/model/ask_price_response_model.dart';
import 'package:abf_ather/helper/dio_helper.dart';
import 'package:dio/dio.dart';

class AskPriceService {
  static Future<AskPriceCategoriesResponse> askPriceDropDown() async {
    log('ask price service called path is :${ApiConstants.askPriceCategory}');
    var response = await DioHelper.getData(
      path: ApiConstants.askPriceCategory,
    );
    log("response ask price: ${response?.data}");
    if (response!.statusCode == 200) {
      return AskPriceCategoriesResponse.fromJson(response.data);
    }
    throw Exception(response.data['message']);
  }
   static Future<AskPriceResponse> askPrice({required AskPriceRequest request}) async {
    log('ask price service called path is :${ApiConstants.askPrice}');
    var response = await DioHelper.postData(
      path: ApiConstants.askPrice,
      data:  FormData.fromMap({
          'f_name': request.fName,
          'l_name': request.lName,
          'phone': request.phone,
          'category_id': request.categoryId,
          'email': request.email,
          'message': request.message
        }));
    
    log("response ask price: ${response?.data}");
    if (response!.statusCode == 200) {
      return AskPriceResponse.fromJson(response.data);
    }
    throw Exception(response.data['message']);
  }
}
