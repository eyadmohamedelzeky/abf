import 'package:abf_ather/core/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonWithIcon extends StatelessWidget {
  const CustomButtonWithIcon({
    super.key,
    required this.onPressed,
    required this.text,
  });
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        width: 300.w,
        height: 60.h,
        child: RawMaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(40.r),
            ),
          ),
          fillColor: AppColors.buttonColor,
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add,
                color: AppColors.whiteColor,
              ),
              SizedBox(width: 5.w),
              Text(
                text,
                style: TextStyle(color: AppColors.whiteColor, fontSize: 20.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
