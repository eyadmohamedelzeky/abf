class CompleteRegisterResponse {
  String? message;
  int? status;
  Data? data;

  CompleteRegisterResponse({this.message, this.status, this.data});

  CompleteRegisterResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

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

class Data {
  String? token;
  String? fName;
  String? lName;
  String? email;
  String? phone;

  Data({this.token, this.fName, this.lName, this.email, this.phone});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    fName = json['f_name'];
    lName = json['l_name'];
    email = json['email'];
    phone = json['phone'];
  }

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
