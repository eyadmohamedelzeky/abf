class LoginResponseModel {
  String? message;
  int? status;
  Data? data;

  LoginResponseModel({this.message, this.status, this.data});

  // From JSON
  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  // To JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }

  // CopyWith method
  LoginResponseModel copyWith({
    String? message,
    int? status,
    Data? data,
  }) {
    return LoginResponseModel(
      message: message ?? this.message,
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }
}

class Data {
  String? token;
  String? fName;
  String? lName;
  String? email;
  String? phone;

  Data({this.token, this.fName, this.lName, this.email, this.phone});

  // From JSON
  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    fName = json['f_name'];
    lName = json['l_name'];
    email = json['email'];
    phone = json['phone'];
  }

  // To JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['f_name'] = fName;
    data['l_name'] = lName;
    data['email'] = email;
    data['phone'] = phone;
    return data;
  }

  // CopyWith method
  Data copyWith({
    String? token,
    String? fName,
    String? lName,
    String? email,
    String? phone,
  }) {
    return Data(
      token: token ?? this.token,
      fName: fName ?? this.fName,
      lName: lName ?? this.lName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }
}
