// // ignore_for_file: prefer_typing_uninitialized_variables

// import 'dart:developer';
// import 'package:hive_flutter/hive_flutter.dart';

// class HiveHelper {
//   static Future<void> init() async {
//     await Hive.initFlutter();
//   }

//   static var boxVars;

//   static Future<void> addToHive(
//       {required String key, required dynamic value}) async {
//     boxVars = await Hive.openBox("modelBox");
//     await boxVars.put(key, value).then((value) {
//       log("Value Added Successfully");
//     }).catchError((error) {
//       log(error.toString());
//     });
//   }

//   static Future<dynamic> getFromHive({required String key}) async {
//     boxVars = await Hive.openBox("modelBox");
//     return boxVars.get(key);
//   }

//   static Future<void> removeFromHive({required String key}) async {
//     boxVars = await Hive.openBox("modelBox");

//     await boxVars.delete(key);
//   }

//   static Future<void> clearAllData() async {
//     await boxVars.clear();
//   }
// }