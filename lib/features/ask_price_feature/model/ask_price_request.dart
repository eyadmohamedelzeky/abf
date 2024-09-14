class AskPriceRequest {
  final String categoryId;
  final String fName;
  final String lName;
  final String email;
  final String phone;
  final String message;

  AskPriceRequest(
      {required this.categoryId,
      required this.fName,
      required this.lName,
      required this.email,
      required this.phone,
      required this.message});
  factory AskPriceRequest.fromJson(Map<String, dynamic> json) {
    return AskPriceRequest(
      categoryId: json['category_id'],
      fName: json['f_name'],
      lName: json['l_name'],
      email: json['email'],
      phone: json['phone'],
      message: json['message'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['f_name'] = fName;
    data['l_name'] = lName;
    data['email'] = email;
    data['phone'] = phone;
    data['message'] = message;
    return data;
  }
}
