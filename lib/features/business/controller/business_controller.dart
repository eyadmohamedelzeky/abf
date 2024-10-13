import 'dart:developer';

import 'package:abf_ather/core/app_varaible/app_varabile.dart';
import 'package:abf_ather/core/services/get_business_service.dart';
import 'package:abf_ather/features/business/controller/business_state.dart';
import 'package:abf_ather/features/business/model/business_respone_model.dart';
import 'package:abf_ather/helper/toast_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BusinessController extends Cubit<BusinessState> {
  BusinessController() : super(BusinessInitial());
  static BusinessController get(context) => BlocProvider.of(context);

  BusinessResponseModel? businessResponse;
  Future<void> getBusiness() async {
    emit(BusinessLoadingState());
    await GetBusinessService.getBusiness().then((value) async {
      businessResponse = value;

      log('businessResponse: ${businessResponse!.toJson()}');
      emit(BusinessSuccessState());
    }).catchError((error) {
      String cleanMessage = formatErrorMessage(error.toString());
      ToastHelper.showToast(
          msg: cleanMessage.toString(), gravity: ToastGravity.BOTTOM);
      emit(
        BusinessErrorState(
          error: error.toString(),
        ),
      );
    });
  }
}
