import 'package:abf_ather/bloc_observer.dart';
import 'package:abf_ather/core/cache/shared_pref.dart';
import 'package:abf_ather/features/app/app.dart';
import 'package:abf_ather/features/auth/view/login.dart';
import 'package:abf_ather/features/home/view/home.dart';
import 'package:abf_ather/helper/dio_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

// void main() async {
//   await HiveHelper.init();
//   WidgetsFlutterBinding.ensureInitialized();
//   DioHelper.init();
//   Bloc.observer = MyBlocObserver();
//   runApp(const ABFApp(
//       // initialRoute: initialRoute
//       ));

//   FlutterNativeSplash.remove();
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await HiveHelper.init();
  await EasyLocalization.ensureInitialized();

  // Hive.registerAdapter(DataAdapter()); // Register the adapter here

  DioHelper.init();
  Bloc.observer = MyBlocObserver();

  // Check if the user is already logged in
  var userModel = await SharedPreferencesService.getUserModel();

  runApp(EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('de')],
      path: 'assets/translations',
      child: ABFApp(
          initialRoute: userModel != null ? HomeScreen.id : LoginScreen.id)));

  FlutterNativeSplash.remove();
}
