import 'package:hive/hive.dart';

part 'login_response_model.g.dart';  // This file will be generated by Hive

@HiveType(typeId: 0)
class LoginResponseModel {
  @HiveField(0)
  String? message;

  @HiveField(1)
  int? status;

  @HiveField(2)
  Data? data;

  LoginResponseModel({this.message, this.status, this.data});

  // From JSON
  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      message: json['message'],
      status: json['status'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
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
}

@HiveType(typeId: 1)
class Data {
  @HiveField(0)
  String? token;

  @HiveField(1)
  String? fName;

  @HiveField(2)
  String? lName;

  @HiveField(3)
  String? email;

  @HiveField(4)
  String? phone;

  Data({this.token, this.fName, this.lName, this.email, this.phone});

  // From JSON
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      token: json['token'],
      fName: json['f_name'],
      lName: json['l_name'],
      email: json['email'],
      phone: json['phone'],
    );
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
}
