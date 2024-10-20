import 'package:abf_ather/core/colors/app_colors.dart';
import 'package:abf_ather/features/projects/model/projects_response_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCardProject extends StatelessWidget {
  const CustomCardProject({
    super.key,
    required this.cardProductsResponse,
    required this.index,
  });
  final ProjectsResponseModel cardProductsResponse;
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
            CachedNetworkImage(
              imageUrl: "${cardProductsResponse.data?[index].image}",
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                    colorFilter:
                        const ColorFilter.mode(Colors.red, BlendMode.colorBurn),
                  ),
                ),
              ),
              placeholder: (context, url) => const Center(
                child: Text('Loading...'),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            SizedBox(height: 8.h),
            Text(
              "${cardProductsResponse.data?[index].name}",
              style: TextStyle(fontSize: 16, color: AppColors.orangeColor),
            ),
            // const SizedBox(height: 8),
            // Text(
            //   '${cardProductsResponse.data?.cartProducts?[index].product?.price} ر.س',
            //   style: const TextStyle(fontSize: 18, color: Colors.green),
            // ),
          ],
        ),
      ),
    );
  }
}
