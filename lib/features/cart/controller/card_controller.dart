import 'dart:developer';

import 'package:abf_ather/core/services/card_products_service.dart';
import 'package:abf_ather/features/cart/controller/cart_state.dart';
import 'package:abf_ather/features/cart/model/card_product_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardController extends Cubit<CardState> {
  CardController() : super(CardInitialState());
  static CardController get(context) => BlocProvider.of(context);

  CardProductsResponse? cardProductsResponse;

  Future<void> getCardProducts() async {
    emit(CardLoadingState());
    await CardProductsService.getCardProducts().then((value) {
      cardProductsResponse = value;
      log('cardProductsResponse: ${cardProductsResponse!.toJson()}');
      emit(CardSuccessState());
    }).catchError((error) {
      emit(CardErrorState(error: error.toString()));
    });
  }
}
