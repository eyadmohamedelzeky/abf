import 'package:abf_ather/core/colors/app_colors.dart';
import 'package:abf_ather/core/constants/app_constants.dart';
import 'package:abf_ather/core/widgets/CutsomTextHeader.dart';
import 'package:abf_ather/core/widgets/csutom_text_form_field.dart';
import 'package:abf_ather/core/widgets/custom_button.dart';
import 'package:abf_ather/core/widgets/custom_text.dart';
import 'package:abf_ather/features/auth/controller/auth_controller.dart';
import 'package:abf_ather/features/auth/controller/auth_state.dart';
import 'package:abf_ather/features/auth/model/register_new_account_request.dart';
import 'package:abf_ather/features/auth/view/login.dart';
import 'package:abf_ather/helper/toast_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterNewAccount extends StatefulWidget {
  const RegisterNewAccount({super.key});
  static String id = 'RegisterNewAccount';
  @override
  State<RegisterNewAccount> createState() => _RegisterNewAccountState();
}

final formKey = GlobalKey<FormState>();

class _RegisterNewAccountState extends State<RegisterNewAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AuthController, AuthState>(
          listener: (context, state) {
            if (state is RegisterErrorState) {
              ToastHelper.showToast(msg: state.error.toString());
            }
          },
          builder: (context, state) {
            final authController = AuthController.get(context);
            return SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100.h,
                        ),
                        Image(
                          image: AssetImage(ImagesConstants.abf),
                        ),
                        SizedBox(height: 60.h),
                        const CustomTextHeader(text: 'تسجيل حساب جديد'),
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomText(
                          text: 'قم بإدخال بريدك الإلكتروني لتسجيل حساب جديد',
                          color: AppColors.greyColor,
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        CustomTextFormField(
                          controller: authController.emailNewAccountController,
                          validator: (email) {
                            if (email!.isEmpty) {
                              return 'هذا الحقل مطلوب';
                            }
                            return null;
                          },
                          hintText: 'أدخل البريد الإلكتروني',
                          suffixIcon: ImagesConstants.emailIcon,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        state is RegisterLoadingState
                            ? const CircularProgressIndicator()
                            : CustomButton(
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    await authController.register(
                                      context,
                                      request: RegisterNewAccountRequest(
                                          email: authController
                                              .emailNewAccountController.text),
                                    );
                                  }
                                },
                                text: 'تسجيل',
                              ),
                        SizedBox(
                          height: 120.h,
                        ),
                        const CustomText(text: 'لديك حساب بالفعل ؟'),
                        SizedBox(
                          height: 5.h,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()),
                                (Route<dynamic> route) => false);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.arrow_back,
                                color: AppColors.buttonColor,
                              ),
                              CustomText(
                                text: ' تسجيل الدخول',
                                fontSize: 18.sp,
                                color: AppColors.buttonColor,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
