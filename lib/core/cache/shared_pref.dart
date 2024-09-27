import 'dart:convert';

import 'package:abf_ather/features/auth/model/login_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const String userKey = 'user_model';

  // Save the user model to SharedPreferences
  static Future<void> storeUserModel(LoginResponseModel user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(userKey, jsonEncode(user.toJson()));
    await storeAccessToken(
        user.data!.token!); // Optional: Save token separately
  }

  // Retrieve the user model from SharedPreferences
  static Future<LoginResponseModel?> getUserModel() async {
    final prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString(userKey);

    if (userJson != null) {
      Map<String, dynamic> userMap = jsonDecode(userJson);
      return LoginResponseModel.fromJson(userMap);
    }
    return null;
  }

  // Save token separately if needed
  static Future<void> storeAccessToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  // Retrieve token
  static Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }
}
