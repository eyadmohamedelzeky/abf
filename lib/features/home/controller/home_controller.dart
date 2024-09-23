import 'dart:convert';
import 'dart:developer';
import 'package:abf_ather/core/services/home_service.dart';
import 'package:abf_ather/core/services/soical_service.dart';
import 'package:abf_ather/features/auth/model/login_response_model.dart';
import 'package:abf_ather/features/home/controller/home_state.dart';
import 'package:abf_ather/features/home/model/favourite_products_response_model.dart';
import 'package:abf_ather/features/home/model/home_response.dart';
import 'package:abf_ather/features/home/model/home_silder_response.dart';
import 'package:abf_ather/features/home/model/product_brands_response_model.dart';
import 'package:abf_ather/features/home/model/product_by_category_model.dart';
import 'package:abf_ather/features/home/model/product_details_response.dart';
import 'package:abf_ather/features/home/model/soical_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class HomeController extends Cubit<HomeState> {
  HomeController() : super(HomeInitial());
  static HomeController get(context) => BlocProvider.of(context);
  LoginResponseModel? userModel;

  HomeSilderResponse homeSilderResponse = HomeSilderResponse();
  HomeResponseModel homeResponse = HomeResponseModel();
  ProductBrandsResponseModel productBrandsResponse =
      ProductBrandsResponseModel();
  ProductDetailsResponseModel productDetailsResponse =
      ProductDetailsResponseModel();
  ProductByCategoryResponseModel productByCategoryResponse =
      ProductByCategoryResponseModel();


  Future<void> getHomeSilder() async {
    emit(HomeSilderLoadingState());
    await ApiHome.getHomeSilder().then((value) {
      homeSilderResponse = value;

      log('homeSilderResponse: ${homeSilderResponse.toJson()}');
      emit(HomeSilderSuccessState());
    }).catchError((error) {
      log('error: ${error.toString()}');
      emit(HomeSilderErrorState(error: error));
    });
  }

  Future<void> getHome() async {
    emit(HomeLoadingState());
    await ApiHome.getHome().then((value) {
      homeResponse = value;

      log('homeResponse: ${homeSilderResponse.toJson()}');
      emit(HomeSuccessState());
    }).catchError((error) {
      log('error: ${error.toString()}');
      emit(HomeErrorState(error: error.toString()));
    });
  }

  Future<void> getProductBrands() async {
    emit(ProductsBrandsLoadingState());
    await ApiHome.getProductsBrands().then((value) {
      productBrandsResponse = value;

      log('ProductBrands: ${homeSilderResponse.toJson()}');
      emit(ProductsBrandsSuccessState());
    }).catchError((error) {
      log('error: ${error.toString()}');
      emit(ProductsBrandsErrorState(error: error));
    });
  }
    Future<void> getProductDetails({required int id}) async {
    emit(ProductDetailsLoadingState());
    await ApiHome.getProductsDetails(
      id
    ).then((value) {
      productDetailsResponse = value;
      log('productDetailsResponse: ${productDetailsResponse.toJson()}');
      emit(ProductDetailsSuccessState());
    }).catchError((error) {
      log('error: ${error.toString()}');
      emit(ProductDetailsErrorState(error: error));
    });
  }

  Future<void> geProductByCategory({required int id}) async {
    emit(ProductByCategoryLoadingState());
    await ApiHome.getProductsByCategory(id).then((value) {
      productByCategoryResponse = value;

      log('productByCategoryResponse: ${productDetailsResponse.toJson()}');
      emit(ProductByCategorySuccessState());
    }).catchError((error) {
      log('error: ${error.toString()}');
      emit(ProductByCategoryErrorState(error: error));
    });
  }

  SoicalResponseModel soicalResponseModel = SoicalResponseModel();
  Future<void> getAllSoical() async {
    emit(GetAllSoicalLoadingState());
    await SoicalService.getAllSoical().then((value) {
      soicalResponseModel = value;

      log('GetAllSoicalResponse: ${productDetailsResponse.toJson()}');
      emit(GetAllSoicalSuccessState());
    }).catchError((error) {
      log('error: ${error.toString()}');
      emit(GetAllSoicalErrorState(error: error));
    });
  }
FavouriteProductsResponseModel favouriteProductsResponseModel = FavouriteProductsResponseModel();
Future<void> getFavouriteProducts() async {
    emit(FavouriteProductsLoadingState());
    await ApiHome.getFavouriteProducts().then((value) {
      favouriteProductsResponseModel = value;
      log('FavouriteProductsResponse: ${homeSilderResponse.toJson()}');
      emit(FavouriteProductsSuccessState());
    }).catchError((error) {
      log('error: ${error.toString()}');
      emit(FavouriteProductsErrorState(error: error));
    });
  }


}
