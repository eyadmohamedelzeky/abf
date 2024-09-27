import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.text,
      this.fontSize,
      this.color,
      this.textAlign,
      this.fontWeight,
      this.overflow,
      this.maxLines});
  final double? fontSize;
  final Color? color;
  final String text;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextOverflow? overflow;
  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxLines,
      textAlign: textAlign,
      text,
      style: TextStyle(
          overflow: overflow,
          fontSize: fontSize ?? 15.sp,
          color: color,
          fontWeight: fontWeight),
    );
  }
}
