abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {}

class LoginErrorState extends AuthState {
  final String error;
  LoginErrorState({required this.error});
}

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {}

class RegisterErrorState extends AuthState {
  final String error;
  RegisterErrorState({required this.error});
}

class SendOtpLoadingState extends AuthState {}

class SendOtpSuccessState extends AuthState {}

class SendOtpErrorState extends AuthState {
  final String error;
  SendOtpErrorState({required this.error});
}

class CheckOtpLoadingState extends AuthState {}

class CheckOtpSuccessState extends AuthState {}

class CheckOtpErrorState extends AuthState {
  final String error;
  CheckOtpErrorState({required this.error});
}

class CompleteRegisterLoadingState extends AuthState {}

class CompleteRegisterSuccessState extends AuthState {}

class CompleteRegisterErrorState extends AuthState {
  final String error;
  CompleteRegisterErrorState({required this.error});
}

class TogglePasswordVisibilityState extends AuthState {}

class ResetPasswordLoadingState extends AuthState {}

class ResetPasswordSuccessState extends AuthState {}

class ResetPasswordErrorState extends AuthState {
  final String error;
  ResetPasswordErrorState({required this.error});
}
