class BusinessResponseModel {
  String? message;
  int? status;
  Data? data;

  BusinessResponseModel({this.message, this.status, this.data});

  BusinessResponseModel.fromJson(Map<String, dynamic> json) {
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
  Duct? duct;
  Duct? repair;

  Data({this.duct, this.repair});

  Data.fromJson(Map<String, dynamic> json) {
    duct = json['duct'] != null ? Duct.fromJson(json['duct']) : null;
    repair = json['repair'] != null ? Duct.fromJson(json['repair']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (duct != null) {
      data['duct'] = duct!.toJson();
    }
    if (repair != null) {
      data['repair'] = repair!.toJson();
    }
    return data;
  }
}

class Duct {
  int? id;
  String? image;
  String? description;
  String? type;

  Duct({this.id, this.image, this.description, this.type});

  Duct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    description = json['description'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['description'] = description;
    data['type'] = type;
    return data;
  }
}
