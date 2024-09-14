import 'package:abf_ather/core/colors/app_colors.dart';
import 'package:abf_ather/core/constants/app_constants.dart';
import 'package:abf_ather/core/widgets/CutsomTextHeader.dart';
import 'package:abf_ather/core/widgets/csutom_text_form_field.dart';
import 'package:abf_ather/core/widgets/custom_button.dart';
import 'package:abf_ather/core/widgets/custom_text.dart';
import 'package:abf_ather/features/auth/controller/auth_controller.dart';
import 'package:abf_ather/features/auth/controller/auth_state.dart';
import 'package:abf_ather/features/auth/model/login_request_model.dart';
import 'package:abf_ather/features/auth/view/forget_password.dart';
import 'package:abf_ather/features/auth/view/register_new_account.dart';
import 'package:abf_ather/features/home/view/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String id = 'LoginScreen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<AuthController, AuthState>(
          listener: (context, state) {
            if (state is LoginSuccessState) {
              Navigator.pushNamed(context, HomeScreen.id);
            }
          },
          builder: (context, state) {
            final authController = AuthController.get(context);
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage(ImagesConstants.abf),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      const CustomTextHeader(
                        text: 'تسجيل الدخول',
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomText(
                        text: 'قم بإدخال بريدك الإلكتروني لتسجيل الدخول',
                        fontSize: 14.sp,
                        color: AppColors.greyColor,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextFormField(
                        controller: authController.emailController,
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
                        height: 10.h,
                      ),
                      CustomTextFormField(
                        obscureText: authController.obscureText,
                        controller: authController.passwordController,
                        validator: (password) {
                          if (password!.isEmpty) {
                            return 'هذا الحقل مطلوب';
                          } else if (password.length < 8) {
                            return 'يجب ان تكون كلمة المرور من 8 حروف على الاقل';
                          }
                          return null;
                        },
                        prefixIcon: IconButton(
                            onPressed: () {
                              authController.togglePasswordVisibility();
                            },
                            icon: authController.icon,
                            color: AppColors.greyColor),
                        //  Icon(
                        //   Icons.visibility,
                        //   color: AppColors.greyColor,
                        // ),
                        hintText: 'أدخل كلمة المرور',
                        suffixIcon: ImagesConstants.passwordIcon,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      InkWell(
                        onTap: () async {
                          Navigator.pushNamed(context, ForgetPasswordScreen.id);
                        },
                        child: Text(
                          'هل نسيت كلمة المرور ؟',
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      state is LoginLoadingState
                          ? const CircularProgressIndicator.adaptive()
                          : CustomButton(
                              text: 'الدخول',
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  await authController.login(
                                    context,
                                    request: LoginRequestModel(

                                        email:
                                            authController.emailController.text,
                                        password: authController
                                            .passwordController.text),
                                  );
                                }
                              },
                            ),
                      SizedBox(
                        height: 10.h,
                      ),
                      InkWell(
                        onTap: () {},
                        child: CustomText(
                          text: 'ليس لديك حساب ؟',
                          fontSize: 16.sp,
                          color: AppColors.greyColor,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterNewAccount(),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.arrow_back,
                                color: AppColors.buttonColor),
                            SizedBox(
                              width: 5.w,
                            ),
                            CustomText(
                              text: 'تسجيل حساب جديد',
                              fontSize: 16.sp,
                              color: AppColors.buttonColor,
                            ),
                          ],
                        ),
                      ),
                    ],
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
