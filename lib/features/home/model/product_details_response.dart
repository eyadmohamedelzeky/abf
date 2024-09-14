class ProductDetailsResponseModel {
  String? message;
  int? status;
  Errors? errors;

  ProductDetailsResponseModel({this.message, this.status, this.errors});

  ProductDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    errors = json['errors'] != null ? Errors.fromJson(json['errors']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    if (errors != null) {
      data['errors'] = errors!.toJson();
    }
    return data;
  }
}

class Errors {
  List<String>? productId;

  Errors({this.productId});

  Errors.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    return data;
  }
}
