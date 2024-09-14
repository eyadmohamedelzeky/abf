class RegisterNewAccountRequest {
  final String email;

  RegisterNewAccountRequest({required this.email});

  factory RegisterNewAccountRequest.fromJson(Map<String, dynamic> json) {
    return RegisterNewAccountRequest(
      email: json['email'] as String,
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }

  RegisterNewAccountRequest copyWith({String? email}) {
    return RegisterNewAccountRequest(
      email: email ?? this.email,
    );
  }
}
