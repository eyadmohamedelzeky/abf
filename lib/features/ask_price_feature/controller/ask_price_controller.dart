import 'dart:developer';
import 'package:abf_ather/core/services/ask_price_service.dart';
import 'package:abf_ather/features/ask_price_feature/controller/ask_price_state.dart';
import 'package:abf_ather/features/ask_price_feature/model/ask_price_request.dart';
import 'package:abf_ather/features/ask_price_feature/model/ask_price_response.dart';
import 'package:abf_ather/features/ask_price_feature/model/ask_price_response_model.dart';
import 'package:abf_ather/helper/toast_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AskPriceController extends Cubit<AskPriceState> {
  AskPriceController() : super(AskPriceInitial());
  static AskPriceController get(context) => BlocProvider.of(context);
  TextEditingController fnForAskPriceController = TextEditingController();
  TextEditingController lnForAskPriceController = TextEditingController();
  TextEditingController emailForAskPriceController = TextEditingController();
  TextEditingController phoneForAskPriceController = TextEditingController();
  TextEditingController messageForAskPriceController = TextEditingController();
  AskPriceCategoriesResponse askPriceCategoriesResponse =
      AskPriceCategoriesResponse();
  AskPriceResponse askPriceResponse = AskPriceResponse();
  Future<void> askPriceDropDown() async {
    emit(AskPriceLoading());
    await AskPriceService.askPriceDropDown().then((value) {
      askPriceCategoriesResponse = value;
      log('ask Price is ${askPriceCategoriesResponse.toJson()}');
      emit(AskPriceSuccess());
    }).catchError(
      (error) {
        emit(
          AskPriceError(
            error: error.toString(),
          ),
        );
      },
    );
  }

  String selectValueForDropDown = '';
  changeAskPriceDropDown(value) {
    selectValueForDropDown = value;
    log('select value is $selectValueForDropDown');
    emit(AskPriceDropDownChange());
  }

  Future<void> askPrice({required AskPriceRequest request}) async {
    emit(AskPriceRequestLoading());
    await AskPriceService.askPrice(request: request).then((value) {
      askPriceResponse = value;
      log('ask Price is ${askPriceResponse.toJson()}');
      emit(AskPriceRequestSuccess());
    }).catchError(
      (error) {
        ToastHelper.showToast(msg: error.toString());
        emit(
          AskPriceRequestError(
            error: error.toString(),
          ),
        );
      },
    );
  }
}
