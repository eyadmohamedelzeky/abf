import 'package:abf_ather/core/colors/app_colors.dart';
import 'package:abf_ather/features/cart/controller/card_controller.dart';
import 'package:abf_ather/features/cart/controller/cart_state.dart';
import 'package:abf_ather/features/cart/model/card_product_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    CardController.get(context).getCardProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CardController, CardState>(
      listener: (context, state) {},
      builder: (context, state) {
        final card = CardController.get(context);
        return Scaffold(
          body: SafeArea(
              child: ListView.builder(
                  itemCount:
                      card.cardProductsResponse?.data?.cartProducts?.length,
                  itemBuilder: (context, index) {
                    return CustomCardProduct(
                      cardProductsResponse: card.cardProductsResponse!,
                      index: index,
                    );
                  })),
        );
      },
    );
  }
}

class CustomCardProduct extends StatelessWidget {
  const CustomCardProduct({
    super.key,
    required this.cardProductsResponse,
    required this.index,
  });
  final CardProductsResponse cardProductsResponse;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.blueColor),
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(20.r)),
      width: double.infinity,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${cardProductsResponse.data?.cartProducts?[index].product?.name}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Text(
              "${cardProductsResponse.data?.cartProducts?[index].product?.description}",
              style: TextStyle(fontSize: 16, color: AppColors.orangeColor),
            ),
            const SizedBox(height: 8),
            Text(
              '${cardProductsResponse.data?.cartProducts?[index].product?.price} ر.س',
              style: const TextStyle(fontSize: 18, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
