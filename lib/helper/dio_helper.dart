import 'dart:io';
import 'dart:developer';
import 'package:abf_ather/core/api/api_constants.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';


class DioHelper {
  static Dio? dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        receiveDataWhenStatusError: true,
        validateStatus: (validateStatus) => true,
        headers: {
          "content-type": 'application/json; charset=utf-8',
        },
        connectTimeout: ApiConstants.timeOutDuration,
        receiveTimeout: ApiConstants.timeOutDuration,
        sendTimeout: ApiConstants.timeOutDuration,
        responseType: ResponseType.json,
      ),
    );
  }

  static Future<Response?> getData({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final token =
          await _getToken(); // Retrieve the token from SharedPreferences

      final response = await dio!.get(
        path,
        queryParameters: queryParameters,
        options: Options(
          validateStatus: (_) => true,
          headers: {
            'Authorization': token != null ? 'Bearer $token' : '',
            'Accept': 'application/json',
            'Accept-Language': 'ar',
          },
        ),
      );

      log("Response headers: ${response.headers}");
      log("Response data: ${response.data}");
      log("Response extra: ${response.extra}");
      log("Response realUri: ${response.realUri}");
      log("Response requestOptions: ${response.requestOptions}");

      return response;
    } on SocketException catch (e) {
      log('SocketException: ${e.message}');
    } on DioException catch (e) {
      log('DioException: ${e.message}');
      String errorMsg = _handleResponse(e.response!);
      BotToast.showText(text: errorMsg);
    }
    return null;
  }

  static Future<Response?> postData({
    required String path,
    dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final token =
          await _getToken(); // Retrieve the token from SharedPreferences

      final response = await dio!.post(
        path,
        data: data,
        options: Options(
          validateStatus: (_) => true,
          contentType: 'application/json',
          headers: {
            'Authorization': token != null ? 'Bearer $token' : '',
            'Accept': 'application/json',
          }..addAll(headers ?? {}),
          followRedirects: false,
        ),
      );

      log("Response headers: ${response.headers}");
      log("Response data: ${response.data}");
      log("Response extra: ${response.extra}");
      log("Response realUri: ${response.realUri}");
      log("Response requestOptions.data: ${response.requestOptions.data}");
      log("Response requestOptions.headers: ${response.requestOptions.headers}");

      return response;
    } on SocketException catch (e) {
      log('SocketException: ${e.message}');
    } on DioException catch (e) {
      log('DioException: ${e.message}');
      log('Response: ${e.response}');
      log('Status code: ${e.response?.statusCode}');
      String errorMsg = _handleResponse(e.response!);
      BotToast.showText(text: errorMsg);
    }
    return null;
  }

  static Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  static String _handleResponse(Response response) {
    return response.statusMessage ?? "Unknown error";
  }
}
