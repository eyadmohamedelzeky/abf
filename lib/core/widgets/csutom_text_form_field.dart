import 'package:abf_ather/core/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      this.autovalidateMode,
      this.suffixIcon,
      this.prefixIcon,
      this.validator,
      this.controller,
      this.onFieldSubmitted,
      this.obscureText,
      this.contentPadding});
  final String hintText;
  final String? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String)? onFieldSubmitted;
  final bool hasIconWithDivider = false;
  final AutovalidateMode? autovalidateMode;
  final bool? obscureText;
  final EdgeInsetsGeometry? contentPadding;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      autovalidateMode: autovalidateMode,
      onFieldSubmitted: onFieldSubmitted,
      controller: controller,
      validator: validator,
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
      decoration: InputDecoration(
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
              vertical: 20.w,
            ),
        prefixIcon: prefixIcon,
        suffixIcon: Padding(
          padding: const EdgeInsets.all(16.0),
          child: hasIconWithDivider == true
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8, left: 8),
                      child: Container(
                        width: 1,
                        height: 24,
                        color: Colors.grey,
                      ),
                    ),
                    Image(image: AssetImage(suffixIcon ?? '')),
                  ],
                )
              : const SizedBox.shrink(),
        ),
        filled: true,
        fillColor: const Color.fromARGB(255, 232, 228, 228),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(30.r),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(30.r),
          ),
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(30.r))),
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColors.greyColor,
          fontSize: 14.sp,
        ),
      ),
    );
  }
}
