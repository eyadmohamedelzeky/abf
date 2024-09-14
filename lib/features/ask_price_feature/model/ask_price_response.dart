class AskPriceResponse {
  String? message;
  int? status;
  Data? data;

  AskPriceResponse({this.message, this.status, this.data});

  AskPriceResponse.fromJson(Map<String, dynamic> json) {
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
  String? askPriceCategoryId;
  String? fName;
  String? lName;
  String? message;
  String? phone;
  String? email;
  int? id;

  Data(
      {this.askPriceCategoryId,
      this.fName,
      this.lName,
      this.message,
      this.phone,
      this.email,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    askPriceCategoryId = json['ask_price_category_id'];
    fName = json['f_name'];
    lName = json['l_name'];
    message = json['message'];
    phone = json['phone'];
    email = json['email'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ask_price_category_id'] = askPriceCategoryId;
    data['f_name'] = fName;
    data['l_name'] = lName;
    data['message'] = message;
    data['phone'] = phone;
    data['email'] = email;
    data['id'] = id;
    return data;
  }
}
