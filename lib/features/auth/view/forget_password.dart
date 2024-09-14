import 'package:abf_ather/core/constants/app_constants.dart';
import 'package:abf_ather/core/widgets/CutsomTextHeader.dart';
import 'package:abf_ather/core/widgets/csutom_text_form_field.dart';
import 'package:abf_ather/core/widgets/custom_app_bar.dart';
import 'package:abf_ather/core/widgets/custom_button.dart';
import 'package:abf_ather/core/widgets/custom_text.dart';
import 'package:abf_ather/features/auth/controller/auth_controller.dart';
import 'package:abf_ather/features/auth/controller/auth_state.dart';
import 'package:abf_ather/features/auth/view/verfiy_code_for_forget_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});
  static const String id = 'ForgetPasswordScreen';
  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocConsumer<AuthController, AuthState>(
        listener: (context, state) {
          if (state is SendOtpSuccessState) {
            Navigator.pushNamed(
              context,
              VerfiyCodeForForgetPasswordScreen.id,
            );
          }
        },
        builder: (context, state) {
          final authController = AuthController.get(context);
          return SingleChildScrollView(
            child: Column(
              children: [
                CutsomAppBarWithIcon(
                  icon: ImagesConstants.smsNotification,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50.h,
                        ),
                        const CustomTextHeader(text: 'هل نسيت كلمة المرور ؟'),
                        SizedBox(
                          height: 8.h,
                        ),
                        const CustomText(
                            text:
                                'قم بإدخال بريدك الإلكتروني لإرسال كود التحقق'),
                        SizedBox(
                          height: 100.h,
                        ),
                        CustomTextFormField(
                          controller: authController.emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'هذا الحقل مطلوب ';
                            }
                            return null;
                          },
                          hintText: 'أدخل البريد الإلكتروني',
                          suffixIcon: ImagesConstants.emailIcon,
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        state is ResetPasswordLoadingState
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : CustomButton(
                                text: 'إرسال',
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    await authController.sendOtp();
                                  }
                                },
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      )),
    );
  }
}
