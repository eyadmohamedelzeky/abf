import 'package:abf_ather/core/colors/app_colors.dart';
import 'package:abf_ather/core/constants/app_constants.dart';
import 'package:abf_ather/core/widgets/CutsomTextHeader.dart';
import 'package:abf_ather/core/widgets/csutom_text_form_field.dart';
import 'package:abf_ather/core/widgets/custom_app_bar.dart';
import 'package:abf_ather/core/widgets/custom_button.dart';
import 'package:abf_ather/core/widgets/custom_text.dart';
import 'package:abf_ather/features/auth/controller/auth_controller.dart';
import 'package:abf_ather/features/auth/controller/auth_state.dart';
import 'package:abf_ather/features/auth/model/complete_register_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({super.key});
  static String id = "CompleteProfile";
  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

final formKey = GlobalKey<FormState>();

class _CompleteProfileState extends State<CompleteProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocConsumer<AuthController, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          final authController = AuthController.get(context);
          return Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CutsomAppBarWithIcon(
                    icon: ImagesConstants.user,
                    color: AppColors.whiteColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          const CustomTextHeader(text: 'إستكمال البيانات'),
                          SizedBox(
                            height: 5.h,
                          ),
                          const CustomText(
                              text: '''قم بإستكمال بياناتك الشخصية لتتمكن
                            من تسجيل حسابك'''),
                          SizedBox(
                            height: 50.h,
                          ),
                          CustomTextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: authController
                                .firstNameControllerForCompleteProfile,
                            validator: (email) {
                              if (email!.isEmpty) {
                                return 'هذا الحقل مطلوب';
                              }
                              return null;
                            },
                            hintText: 'الاسم الأول',
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          CustomTextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: authController
                                .lastNameControllerForCompleteProfile,
                            validator: (email) {
                              if (email!.isEmpty) {
                                return 'هذا الحقل مطلوب';
                              }
                              return null;
                            },
                            hintText: 'الاسم الأخير',
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          CustomTextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: authController
                                .phoneControllerForCompleteProfile,
                            validator: (email) {
                              if (email!.isEmpty) {
                                return 'هذا الحقل مطلوب';
                              }
                              return null;
                            },
                            hintText: ' رقم الجوال',
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          CustomTextFormField(
                            obscureText: authController.obscureText,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: authController
                                .passwordControllerForCompleteProfile,
                            prefixIcon: IconButton(
                                onPressed: () {
                                  authController.togglePasswordVisibility();
                                },
                                icon: authController.icon,
                                color: AppColors.greyColor),
                            validator: (password) {
                              if (password!.isEmpty) {
                                return 'هذا الحقل مطلوب';
                              } else if (password.length < 8) {
                                return 'يجب ان تكون كلمة المرور من 8 حروف على الاقل';
                              }
                              return null;
                            },
                            hintText: 'كلمة المرور  ',
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          CustomTextFormField(
                            obscureText: authController.obscureText,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: authController
                                .confirmPasswordForCompleteProfile,
                            prefixIcon: IconButton(
                                onPressed: () {
                                  authController.togglePasswordVisibility();
                                },
                                icon: authController.icon,
                                color: AppColors.greyColor),
                            validator: (passwordConfirm) {
                              if (passwordConfirm!.isEmpty) {
                                return 'هذا الحقل مطلوب';
                              } else if (authController
                                      .passwordControllerForCompleteProfile
                                      .text !=
                                  authController
                                      .confirmPasswordForCompleteProfile.text) {
                                return 'كلمة المرور غير متطابقة';
                              } else if (passwordConfirm.length < 8) {
                                return 'يجب ان تكون كلمة المرور من 8 حروف على الاقل';
                              }
                              return null;
                            },
                            hintText: 'تأكيد كلمة المرور',
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          state is CompleteRegisterLoadingState
                              ? const CircularProgressIndicator()
                              : CustomButton(
                                  text: 'تأكيد',
                                  onPressed: () async {
                                    if (formKey.currentState!.validate()) {
                                      await authController
                                          .completeRegisterProfile(
                                        context,
                                        request: CompleteRegisterRequest(
                                          email: authController
                                              .emailNewAccountController.text,
                                          fName: authController
                                              .firstNameControllerForCompleteProfile
                                              .text,
                                          lName: authController
                                              .lastNameControllerForCompleteProfile
                                              .text,
                                          phone: authController
                                              .phoneControllerForCompleteProfile
                                              .text,
                                          password: authController
                                              .passwordControllerForCompleteProfile
                                              .text,
                                          passwordConfirmation: authController
                                              .confirmPasswordForCompleteProfile
                                              .text,
                                          otp: authController
                                              .pinCodeForRegisterController
                                              .text,
                                        ),
                                      );
                                    }
                                  },
                                ),
                          SizedBox(
                            height: 50.h,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      )),
    );
  }
}
