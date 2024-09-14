import 'package:abf_ather/core/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CutsomAppBarWithIcon extends StatelessWidget {
  const CutsomAppBarWithIcon({
    super.key,
    required this.icon,
    this.color,
  });
  final String icon;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25.r),
            bottomLeft: Radius.circular(25.r)),
        color: color ?? AppColors.appBarColor,
      ),
      height: 200.h,
      width: double.infinity,
      child: Image(image: AssetImage(icon)),
    );
  }
}
