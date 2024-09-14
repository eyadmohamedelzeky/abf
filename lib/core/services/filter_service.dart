import 'dart:developer';
import 'package:abf_ather/core/api/api_constants.dart';
import 'package:abf_ather/features/product_details/model/filter_request_model.dart';
import 'package:abf_ather/features/product_details/model/filter_response_model.dart';
import 'package:abf_ather/helper/dio_helper.dart';
import 'package:dio/dio.dart';

class FilterService {
  static Future<FilterResponseModel> filterProducts(
      {required FilterRequestModel request}) async {
    log("filterProducts request path: ${ApiConstants.filterPath}");
    log("filterProducts request body: ${request.toJson()}");
    var response = await DioHelper.postData(
      path: ApiConstants.login,
      data: FormData.fromMap(
        {
          'category_id': request.categoryId,
          'brands_id': request.brandsId,
          'bestseller': request.bestseller,
          'price': request.price,
          'rate': request.rate
        },
      ),
    );
    if (response!.statusCode == 200) {
      return FilterResponseModel.fromJson(response.data);
    }
    throw Exception(response.data['message']);
  }
}
