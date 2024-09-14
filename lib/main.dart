import 'dart:developer';
import 'package:abf_ather/bloc_observer.dart';
import 'package:abf_ather/core/cache/shared_pref.dart';
import 'package:abf_ather/features/app/app.dart';
import 'package:abf_ather/features/auth/view/login.dart';
import 'package:abf_ather/features/home/view/home.dart';
import 'package:abf_ather/helper/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

// void main() async {
//   if (userModel != null) {
//     await SharedPreferencesService.storeAccessToken(userModel!.data!.token!);
//     var token = await SharedPreferencesService.getAccessToken();
//     log('token In main:$token');
//   }
//   WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
//   FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
//   DioHelper.init();
//   Bloc.observer = MyBlocObserver();
//   runApp( ABFApp(
//     initialRoute: userModel != null ? HomeScreen.id : LoginScreen.id
//   ));
//   FlutterNativeSplash.remove();
//   // WidgetsFlutterBinding.ensureInitialized();
//   // DioHelper.init();
//   // Bloc.observer = MyBlocObserver();
//   // FlutterNativeSplash.preserve(
//   //     widgetsBinding: WidgetsFlutterBinding.ensureInitialized());
//   // String? token = await SharedPreferencesService.getAccessToken();
//   // if (token != null) {
//   //   log('Token found: $token');
//   // }
//   // FlutterNativeSplash.remove();
//   // runApp(const ABFApp(
//   //     // initialRoute: token != null ? HomeScreen.id : LoginScreen.id
//   //     ));
// }

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Initialize DioHelper and Bloc observer
  DioHelper.init();
  Bloc.observer = MyBlocObserver();

  // Check if token is already saved in SharedPreferences
  String? token = await SharedPreferencesService.getAccessToken();
  log('Token in main: $token');

  // Decide the initial route based on whether the token exists
  String initialRoute =
      (token != null && token.isNotEmpty) ? HomeScreen.id : LoginScreen.id;

  runApp(ABFApp(initialRoute: initialRoute));

  FlutterNativeSplash.remove();
}
