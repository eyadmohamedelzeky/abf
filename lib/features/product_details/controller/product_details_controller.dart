import 'package:abf_ather/core/app_varaible/app_varabile.dart';
import 'package:abf_ather/core/services/filter_service.dart';
import 'package:abf_ather/features/product_details/controller/product_details_state.dart';
import 'package:abf_ather/features/product_details/model/filter_request_model.dart';
import 'package:abf_ather/features/product_details/model/filter_response_model.dart';
import 'package:abf_ather/helper/toast_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductDetailsController extends Cubit<ProductDetailsState> {
  ProductDetailsController() : super(ProductDetailsInitial());
  static ProductDetailsController get(BuildContext context) =>
      BlocProvider.of(context);
  List<bool> logoChecked = [];
  void toggleLogoChecked(bool checked, int index) {
    logoChecked[index] = checked;
    emit(ToggleCheckBoxState());
  }

  bool productMoreThanBuy = false;
  void toggleProductMoreThanBuy(bool checked) {
    productMoreThanBuy = checked;
    emit(ProductMoreThanBuyState());
  }

  int selectedValueForPrice = -1;

  void handleRadioValueChangeForPrice(int value) {
    selectedValueForPrice = value;
    emit(ChangeRadioButtonState());
  }

  int selectedValueForRating = -1; // Default selected value

  void handleRadioValueChangeForRating(int value) {
    selectedValueForRating = value;
    emit(ChangeRadioButtonState());
  }

  FilterResponseModel filterResponseModel = FilterResponseModel();
  Future<void> filterProducts({required FilterRequestModel request}) async {
    emit(FilterProductLoadingState());
    await FilterService.filterProducts(
      request: request,
    ).then((value) {
      filterResponseModel = value;
      emit(FilterProductSuccessState());
    }).catchError((error) {
      String cleanMessage = formatErrorMessage(error.toString());
      ToastHelper.showToast(
          msg: cleanMessage.toString(), gravity: ToastGravity.BOTTOM);
      emit(
        FilterProductErrorState(
          error: error.toString(),
        ),
      );
    });
  }
  
}
