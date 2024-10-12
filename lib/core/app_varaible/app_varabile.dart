import 'dart:developer';
import 'package:abf_ather/core/cache/shared_pref.dart';
import 'package:abf_ather/features/auth/model/login_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
LoginResponseModel? userModel;

Future<void> updateUserModel(LoginResponseModel? user) async {
  if (user != null && user.data?.token != null) {
    userModel = user;
    await SharedPreferencesService.storeUserModel(userModel!);
    log('Token saved: ${userModel?.data?.token}');
    log('UserModel: ${userModel?.toJson()}');
  } else {
    log('User or token is null');
  }
}


Color hexToColor(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 7 || hexString.length == 9) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

String formatErrorMessage(String message) {
  // استخدام تعبير عادي لإزالة "Exception: { }" والحصول على النص المطلوب
  final regex = RegExp(r'Exception: \{(.*?)\}');
  final match = regex.firstMatch(message);

  if (match != null) {
    // استخراج النص داخل الأقواس
    String innerMessage = match.group(1) ?? '';
    // إزالة الأقواس المربعة
    innerMessage = innerMessage.replaceAll(RegExp(r'\[|\]'), '');
    // إعادة صياغة الرسالة
    return innerMessage.trim();
  }

  return message; // في حال عدم وجود تطابق، نعيد الرسالة الأصلية
}

final spinkit = SpinKitFadingCircle(
  itemBuilder: (BuildContext context, int index) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: index.isEven ? Colors.red : Colors.green,
      ),
    );
  },
);
