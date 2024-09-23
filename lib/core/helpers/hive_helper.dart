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
//       log("Value : $value with key: $key Added Successfully");
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

//   static Future<void> clearDataAfterLogout() async {
//     // await boxVars.delete(AppConstants.hiveUserModel);
//     // await boxVars.delete(AppConstants.hiveSelectedSubscriptionModel);
//   }

//   static Future<void> clearDataAfterDeleteAccount() async {
//     // await boxVars.delete(AppConstants.hiveSavedEmail);
//     // await boxVars.delete(AppConstants.hiveSavedPassword);
//     // await boxVars.delete(AppConstants.hiveUserModel);
//     // await boxVars.delete(AppConstants.hiveSelectedSubscriptionModel);
//   }
// }

import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';

class HiveHelper {
  static Future<void> init() async {
    await Hive.initFlutter();
  }

  static Future<Box> getBox() async {
    return await Hive.openBox("modelBox");
  }

  static Future<void> addToHive(
      {required String key, required dynamic value}) async {
    var box = await getBox(); // Open the box here
    await box.put(key, value).then((_) {
      log("Value : $value with key: $key Added Successfully");
    }).catchError((error) {
      log(error.toString());
    });
  }

  static Future<dynamic> getFromHive({required String key}) async {
    var box = await getBox(); // Open the box here
    return box.get(key);
  }

  static Future<void> removeFromHive({required String key}) async {
    var box = await getBox(); // Open the box here
    await box.delete(key);
  }

  static Future<void> clearAllData() async {
    var box = await getBox(); // Open the box here
    await box.clear();
  }

  // Other methods remain unchanged
}
