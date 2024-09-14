class ResetPasswordRequest {
  final String password;
  final String passwordConfirmation;
  final String email;
  final String otp;

  ResetPasswordRequest({
    required this.password,
    required this.passwordConfirmation,
    required this.email,
    required this.otp,
  });

  factory ResetPasswordRequest.fromJson(Map<String, dynamic> json) {
    return ResetPasswordRequest(
      password: json['password'],
      passwordConfirmation: json['password_confirmation'],
      email: json['email'],
      otp: json['otp'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'password': password,
      'password_confirmation': passwordConfirmation,
      'email': email,
      'otp': otp,
    };
  }

  // Method to create a copy of the User with updated fields
  ResetPasswordRequest copyWith({
    String? password,
    String? passwordConfirmation,
    String? email,
    String? otp,
  }) {
    return ResetPasswordRequest(
      password: password ?? this.password,
      passwordConfirmation: passwordConfirmation ?? this.passwordConfirmation,
      email: email ?? this.email,
      otp: otp ?? this.otp,
    );
  }
}
