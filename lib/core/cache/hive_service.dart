import 'dart:convert';

import 'package:abf_ather/features/auth/model/login_response_model.dart';
import 'package:hive/hive.dart';

class HiveService {
  Future<LoginResponseModel?> getUserData() async {
    var authBox = Hive.box<String>('authBox');
    String? userDataJson = authBox.get('user_data');
    if (userDataJson != null) {
      return LoginResponseModel.fromJson(jsonDecode(userDataJson));
    }
    return null;
  }

  Future<void> saveUserData(LoginResponseModel userModel) async {
    var authBox = Hive.box<String>('authBox');
    await authBox.put('user_data', jsonEncode(userModel.toJson()));
  }
}
