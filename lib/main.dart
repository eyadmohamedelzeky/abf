import 'package:abf_ather/bloc_observer.dart';
import 'package:abf_ather/core/cache/hive_service.dart';
import 'package:abf_ather/features/app/app.dart';
import 'package:abf_ather/features/auth/model/login_response_model.dart';
import 'package:abf_ather/features/auth/view/login.dart';
import 'package:abf_ather/features/home/view/home.dart';
import 'package:abf_ather/helper/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();

  // Open the auth box
  await Hive.openBox<String>('authBox');

  // Initialize DioHelper and Bloc observer
  DioHelper.init();
  Bloc.observer = MyBlocObserver();

  // Check if user data exists in Hive
  HiveService userService = HiveService();
  LoginResponseModel? userData = await userService.getUserData();

  // Decide the initial route based on whether user data exists
  String initialRoute =
      (userData != null && userData.data?.token?.isNotEmpty == true)
          ? HomeScreen.id
          : LoginScreen.id;

  runApp(ABFApp(initialRoute: initialRoute));

  FlutterNativeSplash.remove();
}
