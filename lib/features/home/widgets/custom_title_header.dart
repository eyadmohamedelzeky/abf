import 'package:abf_ather/core/colors/app_colors.dart';
import 'package:abf_ather/core/widgets/CutsomTextHeader.dart';
import 'package:abf_ather/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTitleHeader extends StatelessWidget {
  const CustomTitleHeader({
    super.key,
    required this.text,
    required this.description,
    this.fontSize,
  });
  final String text;
  final String description;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.arrow_back_ios,
              color: AppColors.orangeColor,
            ),
            CustomText(
              fontSize: 16.sp,
              text: 'عرض المزيد',
              color: AppColors.orangeColor,
            ),
          ],
        ),
        //const Spacer(),
        Column(
          children: [
            CustomTextHeader(
              fontSize: fontSize,
              text: text,
            ),
            CustomText(
              text: description,
              color: AppColors.greyColor,
            )
          ],
        )
      ],
    );
  }
}