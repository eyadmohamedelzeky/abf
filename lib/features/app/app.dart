import 'package:abf_ather/core/colors/app_colors.dart';
import 'package:abf_ather/features/ask_price_feature/controller/ask_price_controller.dart';
import 'package:abf_ather/features/ask_price_feature/view/ask_price_screen.dart';
import 'package:abf_ather/features/auth/controller/auth_controller.dart';
import 'package:abf_ather/features/auth/view/complete_profile.dart';
import 'package:abf_ather/features/auth/view/forget_password.dart';
import 'package:abf_ather/features/auth/view/login.dart';
import 'package:abf_ather/features/auth/view/new_password_screen.dart';
import 'package:abf_ather/features/auth/view/register_new_account.dart';
import 'package:abf_ather/features/auth/view/verfiy_code_for_forget_password.dart';
import 'package:abf_ather/features/auth/view/verfiy_code_for_register.dart';
import 'package:abf_ather/features/home/controller/home_controller.dart';
import 'package:abf_ather/features/home/view/home.dart';
import 'package:abf_ather/features/product_details/controller/product_details_controller.dart';
import 'package:abf_ather/features/product_details/view/product_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ABFApp extends StatelessWidget {
  final String initialRoute;

  const ABFApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => AuthController()),
              BlocProvider(create: (context) => HomeController()),
              BlocProvider(create: (context) => ProductDetailsController()),
              BlocProvider(
                  create: (context) =>
                      AskPriceController()..askPriceDropDown()),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primaryColor: AppColors.whiteColor,
                scaffoldBackgroundColor: AppColors.whiteColor,
                brightness: Brightness.light,
                useMaterial3: true,
              ),
              initialRoute: initialRoute, // Set the initial route dynamically
              routes: {
                LoginScreen.id: (context) => const LoginScreen(),
                ForgetPasswordScreen.id: (context) =>
                    const ForgetPasswordScreen(),
                VerfiyCodeForRegisterScreen.id: (context) =>
                    const VerfiyCodeForRegisterScreen(),
                NewPasswordScreen.id: (context) => const NewPasswordScreen(),
                RegisterNewAccount.id: (context) => const RegisterNewAccount(),
                CompleteProfile.id: (context) => const CompleteProfile(),
                HomeScreen.id: (context) => const HomeScreen(),
                ProductCategory.id: (context) => const ProductCategory(),
                VerfiyCodeForForgetPasswordScreen.id: (context) =>
                    const VerfiyCodeForForgetPasswordScreen(),
                AskPriceScreen.id: (context) => const AskPriceScreen(),
              },
            ),
          ),
        );
      },
    );
  }
}
