class CheckOtpRequest {
  final String email;
  final String otp;

  CheckOtpRequest({required this.email, required this.otp});

  factory CheckOtpRequest.fromJson(Map<String, dynamic> json) {
    return CheckOtpRequest(
      email: json['email'] as String,
      otp: json['otp'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'otp': otp,
    };
  }

  CheckOtpRequest copyWith({String? email, String? otp}) {
    return CheckOtpRequest(
      email: email ?? this.email,
      otp: otp ?? this.otp,
    );
  }
}
