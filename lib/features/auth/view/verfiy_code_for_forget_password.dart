import 'package:abf_ather/core/colors/app_colors.dart';
import 'package:abf_ather/core/constants/app_constants.dart';
import 'package:abf_ather/core/widgets/CutsomTextHeader.dart';
import 'package:abf_ather/core/widgets/custom_app_bar.dart';
import 'package:abf_ather/core/widgets/custom_button.dart';
import 'package:abf_ather/core/widgets/custom_text.dart';
import 'package:abf_ather/features/auth/controller/auth_controller.dart';
import 'package:abf_ather/features/auth/controller/auth_state.dart';
import 'package:abf_ather/features/auth/view/new_password_screen.dart';
import 'package:abf_ather/helper/toast_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otp_pin_field/otp_pin_field.dart';
import 'package:pinput/pinput.dart';
class VerfiyCodeForForgetPasswordScreen extends StatefulWidget {
  const VerfiyCodeForForgetPasswordScreen({super.key});
  static const String id = 'VerfiyCodeForForgetPasswordScreen';
  @override
  State<VerfiyCodeForForgetPasswordScreen> createState() => _VerfiyCodeForForgetPasswordScreenState();
}

final otpPinFieldController = GlobalKey<OtpPinFieldState>();

class _VerfiyCodeForForgetPasswordScreenState extends State<VerfiyCodeForForgetPasswordScreen> {
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 60,
    textStyle: TextStyle(
      fontSize: 22.sp,
      color: AppColors.whiteColor,
    ),
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(30),
      border: Border.all(color: Colors.transparent),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AuthController, AuthState>(
          listener: (context, state) {
          },
          builder: (context, state) {
            final authController = AuthController.get(context);
            return SingleChildScrollView(
              child: Column(
                children: [
                  CutsomAppBarWithIcon(icon: ImagesConstants.stars),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50.h,
                        ),
                        const CustomTextHeader(text: 'كود التحقق'),
                        SizedBox(
                          height: 5.h,
                        ),
                        const CustomText(
                            textAlign: TextAlign.center,
                            text:
                                'قم بكتابة كود التحقق المكون من 5 أرقام الذي تم إرساله إليك عبر البريد الإلكتروني'),
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomText(
                            text:
                                authController.emailNewAccountController.text),
                        SizedBox(
                          height: 10.h,
                        ),
                        Pinput(
                          controller:authController.pinCodeForForgetPasswordController ,
                          length: 5,
                          defaultPinTheme: defaultPinTheme.copyWith(
                            textStyle: TextStyle(
                              fontSize: 22.sp,
                              color: AppColors.whiteColor,
                            ),
                            decoration: defaultPinTheme.decoration!.copyWith(
                              border: Border.all(
                                  color: AppColors.greyWithShadeColor),
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          focusedPinTheme: defaultPinTheme.copyWith(
                            textStyle: TextStyle(
                              fontSize: 22.sp,
                              color: AppColors.whiteColor,
                            ),
                            decoration: defaultPinTheme.decoration!.copyWith(
                              // color: Colors.black,
                              border: Border.all(
                                  color: AppColors.greyWithShadeColor),
                            ),
                          ),
                          submittedPinTheme: defaultPinTheme.copyWith(
                            textStyle: TextStyle(
                              fontSize: 22.sp,
                              //  color: Colors.black,
                            ),
                          ),
                          onCompleted: (pin) => debugPrint(pin),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        CustomButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, NewPasswordScreen.id);
                            },
                            text: 'تحقق'),
                        SizedBox(
                          height: 60.h,
                        ),
                        CustomText(
                          text: 'لم يتم إرسال كود التحقق ؟',
                          color: AppColors.greyColor,
                          fontSize: 16.sp,
                        ),
                        SizedBox(height: 20.h),
                        IconButton(
                          onPressed: () async {
                            await authController.sendOtp();
                            ToastHelper.showToast(msg: 'تم ارسال الكود');
                          },
                          icon: Icon(
                            Icons.refresh,
                            color: AppColors.buttonColor,
                          ),
                        ),
                        CustomText(
                          text: 'أرسل الكود مرة أخرى',
                          color: AppColors.buttonColor,
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
