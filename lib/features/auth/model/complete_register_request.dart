class CompleteRegisterRequest {
  final String fName;
  final String lName;
  final String phone;
  final String password;
  final String passwordConfirmation;
  final String email;
  final String otp;

  CompleteRegisterRequest({
    required this.fName,
    required this.lName,
    required this.phone,
    required this.password,
    required this.passwordConfirmation,
    required this.email,
    required this.otp,
  });

  // Factory method to create a User from JSON
  factory CompleteRegisterRequest.fromJson(Map<String, dynamic> json) {
    return CompleteRegisterRequest(
      fName: json['f_name'],
      lName: json['l_name'],
      phone: json['phone'],
      password: json['password'],
      passwordConfirmation: json['password_confirmation'],
      email: json['email'],
      otp: json['otp'],
    );
  }

  // Method to convert User to JSON
  Map<String, dynamic> toJson() {
    return {
      'f_name': fName,
      'l_name': lName,
      'phone': phone,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'email': email,
      'otp': otp,
    };
  }

  // Method to create a copy of the User with updated fields
  CompleteRegisterRequest copyWith({
    String? fName,
    String? lName,
    String? phone,
    String? password,
    String? passwordConfirmation,
    String? email,
    String? otp,
  }) {
    return CompleteRegisterRequest(
      fName: fName ?? this.fName,
      lName: lName ?? this.lName,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      passwordConfirmation: passwordConfirmation ?? this.passwordConfirmation,
      email: email ?? this.email,
      otp: otp ?? this.otp,
    );
  }
}
