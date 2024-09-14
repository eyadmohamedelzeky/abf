import 'dart:developer';

import 'package:abf_ather/core/api/api_constants.dart';
import 'package:abf_ather/core/app_varaible/app_varabile.dart';
import 'package:abf_ather/features/home/model/home_response.dart';
import 'package:abf_ather/features/home/model/home_silder_response.dart';
import 'package:abf_ather/features/home/model/product_brands_response_model.dart';
import 'package:abf_ather/features/home/model/product_by_category_model.dart';
import 'package:abf_ather/helper/dio_helper.dart';

class ApiHome {
  static Future<HomeSilderResponse> getHomeSilder() async {
    log("getHomeSilder request path: ${ApiConstants.homeSilder}");

    var response = await DioHelper.getData(
      path: ApiConstants.homeSilder,
    );

    log('Token In homeSilder: ${userModel?.data?.token}');
    log("Response: ${response?.data}");

    if (response!.statusCode == 200) {
      return HomeSilderResponse.fromJson(response.data);

     
    }
    throw Exception(response.data['message'].toString());
  }

  static Future<HomeResponseModel> getHome() async {
    log("home request path: ${ApiConstants.homeSilder}");
    var response = await DioHelper.getData(
      path: ApiConstants.home,
    );
    log('token In home:${userModel?.data?.token}');
    log("response: ${response?.data}");
    if (response!.statusCode == 200) {
      return HomeResponseModel.fromJson(response.data);
    }
    throw Exception(response.data['message']);
  }

  static Future<ProductBrandsResponseModel> getProductsBrands() async {
    log("productBrands request path: ${ApiConstants.productBrands}");
    var response = await DioHelper.getData(
      path: ApiConstants.productBrands,
    );
    log('token In productBrands:${userModel?.data?.token}');
    log("response: ${response?.data}");
    if (response!.statusCode == 200) {
      return ProductBrandsResponseModel.fromJson(response.data);
    }
    throw Exception(response.data['message']);
  }

  // static Future<ProductDetailsResponseModel> getProductsDetails(int id) async {
  //   log("productBrands request path: ${ApiConstants.productBrandsDetails(id)}");
  //   var response = await DioHelper.getData(
  //     path: ApiConstants.productBrandsDetails(id),
  //     // queryParameters: {'product_category_id': id}
  //   );
  //   log('token In productBrands:${userModel?.data?.token}');
  //   log("response: ${response?.data}");
  //   if (response!.statusCode == 200) {
  //     return ProductDetailsResponseModel.fromJson(response.data);
  //   }
  //   throw Exception(response.data['message']);
  // }

  static Future<ProductByCategoryResponseModel> getProductsByCategory(
      int id) async {
    log("productByCategory request path: ${ApiConstants.productByCategory(id)}");
    var response = await DioHelper.getData(
      path: ApiConstants.productByCategory(id),
      // queryParameters: {'product_category_id': id}
    );
    log('token In productByCategory:${userModel?.data?.token}');
    log("response: ${response?.data}");
    if (response!.statusCode == 200) {
      return ProductByCategoryResponseModel.fromJson(response.data);
    }
    throw Exception(response.data['message']);
  }
}
