import 'package:abf_ather/core/colors/app_colors.dart';
import 'package:abf_ather/core/constants/app_constants.dart';
import 'package:abf_ather/core/widgets/CutsomTextHeader.dart';
import 'package:abf_ather/core/widgets/csutom_text_form_field.dart';
import 'package:abf_ather/core/widgets/custom_app_bar.dart';
import 'package:abf_ather/core/widgets/custom_button.dart';
import 'package:abf_ather/core/widgets/custom_text.dart';
import 'package:abf_ather/features/auth/controller/auth_controller.dart';
import 'package:abf_ather/features/auth/controller/auth_state.dart';
import 'package:abf_ather/features/auth/model/reset_password_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});
  static String id = 'NewPasswordScreen';
  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocConsumer<AuthController, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final auth = AuthController.get(context);
          return SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  CutsomAppBarWithIcon(icon: ImagesConstants.lock),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 70.h,
                        ),
                        const CustomTextHeader(text: 'كلمة المرور الجديدة'),
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomText(
                          text: 'قم بتعيين كلمة المرور الجديدة الخاصة بحسابك',
                          color: AppColors.greyColor,
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        CustomTextFormField(
                          controller: auth
                              .passwordControllerForForgetPasswordController,
                          validator: (email) {
                            if (email!.isEmpty) {
                              return 'هذا الحقل مطلوب';
                            }
                            return null;
                          },
                          prefixIcon: Icon(
                            Icons.visibility,
                            color: AppColors.greyColor,
                          ),
                          hintText: 'كلمة المرور الجديدة',
                          suffixIcon: ImagesConstants.passwordIcon,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomTextFormField(
                          controller:
                              auth.confirmPasswordForForgetPasswordController,
                          validator: (email) {
                            if (email!.isEmpty) {
                              return 'هذا الحقل مطلوب';
                            } else if (auth
                                    .passwordControllerForForgetPasswordController
                                    .text !=
                                auth.confirmPasswordForForgetPasswordController
                                    .text) {
                              return 'كلمه المرور غير متطابقة';
                            }
                            return null;
                          },
                          prefixIcon: Icon(
                            Icons.visibility,
                            color: AppColors.greyColor,
                          ),
                          hintText: 'تأكيد كلمة المرور الجديدة',
                          suffixIcon: ImagesConstants.passwordIcon,
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        state is ResetPasswordLoadingState
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : CustomButton(
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    await auth.resetPassword(
                                      context,
                                      request: ResetPasswordRequest(
                                          email: auth.emailController.text,
                                          password: auth
                                              .passwordControllerForForgetPasswordController
                                              .text,
                                          passwordConfirmation: auth
                                              .confirmPasswordForForgetPasswordController
                                              .text,
                                          otp: auth
                                              .pinCodeForForgetPasswordController
                                              .text),
                                    );
                                  }
                                },
                                text: 'تأكيد')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      )),
    );
  }
}
