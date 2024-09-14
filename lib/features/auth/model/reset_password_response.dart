class ResetPasswordResponse {
  String? message;
  int? status;
  dynamic data;
  dynamic errors;

  ResetPasswordResponse({this.message, this.status, this.data, this.errors});

  ResetPasswordResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'];
    errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    data['status'] = status;
    data['data'] = this.data;
    data['errors'] = errors;
    return data;
  }

  // Copy with method
  ResetPasswordResponse copyWith({
    String? message,
    int? status,
    dynamic data,
    dynamic errors,
  }) {
    return ResetPasswordResponse(
      message: message ?? this.message,
      status: status ?? this.status,
      data: data ?? this.data,
      errors: errors ?? this.errors,
    );
  }
}
