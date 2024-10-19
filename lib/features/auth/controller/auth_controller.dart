import 'dart:developer';
import 'package:abf_ather/core/app_varaible/app_varabile.dart';
import 'package:abf_ather/core/cache/shared_pref.dart';
import 'package:abf_ather/core/services/auth_service/check_otp.dart';
import 'package:abf_ather/core/services/auth_service/complete_register_service.dart';
import 'package:abf_ather/core/services/auth_service/login_service.dart';
import 'package:abf_ather/core/services/auth_service/register_service.dart';
import 'package:abf_ather/core/services/auth_service/reset_password_service.dart';
import 'package:abf_ather/core/services/auth_service/send_otp_service.dart';
import 'package:abf_ather/features/auth/controller/auth_state.dart';
import 'package:abf_ather/features/auth/model/check_otp_request.dart';
import 'package:abf_ather/features/auth/model/check_otp_response.dart';
import 'package:abf_ather/features/auth/model/complete_register_request.dart';
import 'package:abf_ather/features/auth/model/complete_register_response.dart';
import 'package:abf_ather/features/auth/model/login_request_model.dart';
import 'package:abf_ather/features/auth/model/register_new_account_request.dart';
import 'package:abf_ather/features/auth/model/register_new_account_response.dart';
import 'package:abf_ather/features/auth/model/reset_password_request.dart';
import 'package:abf_ather/features/auth/model/reset_password_response.dart';
import 'package:abf_ather/features/auth/model/send_otp_response.dart';
import 'package:abf_ather/features/auth/view/complete_profile.dart';
import 'package:abf_ather/features/auth/view/login.dart';
import 'package:abf_ather/features/auth/view/verfiy_code_for_register.dart';
import 'package:abf_ather/helper/toast_helper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthController extends Cubit<AuthState> {
  AuthController() : super(AuthInitial());

  static AuthController get(context) => BlocProvider.of(context);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController pinCodeForRegisterController =
      TextEditingController();
  final TextEditingController pinCodeForForgetPasswordController =
      TextEditingController();
  final TextEditingController emailNewAccountController =
      TextEditingController();

  final TextEditingController firstNameControllerForCompleteProfile =
      TextEditingController();
  final TextEditingController lastNameControllerForCompleteProfile =
      TextEditingController();
  final TextEditingController confirmPasswordForCompleteProfile =
      TextEditingController();
  final TextEditingController passwordControllerForCompleteProfile =
      TextEditingController();
  final TextEditingController phoneControllerForCompleteProfile =
      TextEditingController();

  final TextEditingController emailForForgetPasswordController =
      TextEditingController();
  final TextEditingController confirmPasswordForForgetPasswordController =
      TextEditingController();
  final TextEditingController passwordControllerForForgetPasswordController =
      TextEditingController();

  bool obscureText = true; // State variable to track password visibility
  Icon icon = const Icon(Icons.visibility);
  void togglePasswordVisibility() {
    obscureText = !obscureText;
    icon = obscureText
        ? const Icon(Icons.visibility)
        : const Icon(Icons.visibility_off);
    emit(TogglePasswordVisibilityState());
  }

  Future<void> login(BuildContext context,
      {required LoginRequestModel request}) async {
    emit(LoginLoadingState());
    await LoginApiService.login(request: request)
        .then((loginResponseModel) async {
      loginResponseModel = loginResponseModel;
      log('loginResponseModel after Login is : ${loginResponseModel.toJson()}');
      await updateUserModel(loginResponseModel);
      await SharedPreferencesService.storeUserModel(loginResponseModel);
      emit(LoginSuccessState());
    }).catchError((error) {
      String cleanMessage = formatErrorMessage(error.toString());
      ToastHelper.showToast(msg: cleanMessage, gravity: ToastGravity.BOTTOM);
      emit(LoginErrorState(error: error.toString()));
    });
  }

  SendOtpResponse? sendOtpResponse;
  Future<void> sendOtp() async {
    emit(SendOtpLoadingState());
    await SendOtpService.sendOtp(
            request: RegisterNewAccountRequest(
                email: emailNewAccountController.text))
        .then((value) {
      sendOtpResponse = value;
      emit(SendOtpSuccessState());
    }).catchError((error) {
      String cleanMessage = formatErrorMessage(error.toString());
      ToastHelper.showToast(
          msg: cleanMessage.toString(), gravity: ToastGravity.BOTTOM);
      emit(
        SendOtpErrorState(
          error: error.toString(),
        ),
      );
    });
  }

  RegisterNewAccountResponse? registerNewAccountResponse;
  Future<void> register(
    BuildContext context, {
    required RegisterNewAccountRequest request,
  }) async {
    emit(RegisterLoadingState());
    await RegisterApiService.register(request: request).then((value) async {
      registerNewAccountResponse = value;
      emit(RegisterSuccessState());
      await sendOtp();
      Navigator.pushNamed(context, VerfiyCodeForRegisterScreen.id);
    }).catchError((error) {
      ToastHelper.showToast(msg: error);
      String cleanMessage = formatErrorMessage(error.toString());
      ToastHelper.showToast(
          msg: cleanMessage.toString(), gravity: ToastGravity.BOTTOM);
      emit(
        RegisterErrorState(
          error: error.toString(),
        ),
      );
    });
  }

  CheckOtpResponse? checkOtpResponse;
  Future<void> checkOtp(BuildContext context,
      {required CheckOtpRequest request}) async {
    emit(CheckOtpLoadingState());
    await CheckOtpService.checkOtp(request: request).then((value) async {
      checkOtpResponse = value;
      emit(CheckOtpSuccessState());
      Navigator.pushNamed(context, CompleteProfile.id);
    }).catchError((error) {
      String cleanMessage = formatErrorMessage(error.toString());
      ToastHelper.showToast(
          msg: cleanMessage.toString(), gravity: ToastGravity.BOTTOM);
      emit(
        CheckOtpErrorState(
          error: error.toString(),
        ),
      );
    });
  }

  CompleteRegisterResponse? completeRegisterResponse;
  Future<void> completeRegisterProfile(BuildContext context,
      {required CompleteRegisterRequest request}) async {
    emit(CompleteRegisterLoadingState());
    await CompleteRegisterService.completeRegisterProfile(request: request)
        .then((value) async {
      completeRegisterResponse = value;
      emit(CompleteRegisterSuccessState());
      Navigator.pushNamed(context, LoginScreen.id);
    }).catchError((error) {
      log('error while complete register profile: $error');
      String cleanMessage = formatErrorMessage(error.toString());
      ToastHelper.showToast(
          msg: cleanMessage.toString(), gravity: ToastGravity.BOTTOM);
      emit(CompleteRegisterErrorState(error: cleanMessage.toString()));
    });
  }

  ResetPasswordResponse? resetPasswordResponse;
  Future<void> resetPassword(BuildContext context,
      {required ResetPasswordRequest request}) async {
    emit(ResetPasswordLoadingState());
    await ResetPasswordService.resetPassword(request: request)
        .then((value) async {
      resetPasswordResponse = value;
      //  await sendOtp();
      emit(ResetPasswordSuccessState());
      Navigator.pushNamed(context, LoginScreen.id);
    }).catchError((error) {
      log('error while reset Password: $error');
      String cleanMessage = formatErrorMessage(error.toString());
      ToastHelper.showToast(
          msg: cleanMessage.toString(), gravity: ToastGravity.BOTTOM);
      emit(ResetPasswordErrorState(error: cleanMessage.toString()));
    });
  }
}
