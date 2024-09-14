import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextHeader extends StatelessWidget {
  const CustomTextHeader({super.key, required this.text, this.fontSize, this.textAlign});
  final String text;
  final double? fontSize;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign:textAlign ,
      text,
      style:
          TextStyle(fontSize: fontSize ?? 25.sp, fontWeight: FontWeight.bold,),
    );
  }
}
