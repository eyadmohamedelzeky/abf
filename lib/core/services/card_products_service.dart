import 'dart:developer';

import 'package:abf_ather/core/api/api_constants.dart';
import 'package:abf_ather/core/app_varaible/app_varabile.dart';
import 'package:abf_ather/features/cart/model/card_product_response.dart';
import 'package:abf_ather/helper/dio_helper.dart';

class CardProductsService {
  static Future<CardProductsResponse> getCardProducts() async {
    log("getCardProducts request path: ${ApiConstants.cartProducts}.");

    var response = await DioHelper.getData(
      path: ApiConstants.cartProducts,
    );

    log('Token In cardProducts: ${userModel?.data?.token}');
    log("Response: ${response?.data}");

    if (response!.statusCode == 200) {
      return CardProductsResponse.fromJson(response.data);
    }
    throw Exception(response.data['message'].toString());
  }
}
