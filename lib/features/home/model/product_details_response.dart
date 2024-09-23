// class ProductDetailsResponseModel {
//   String? message;
//   int? status;
//   Errors? errors;

//   ProductDetailsResponseModel({this.message, this.status, this.errors});

//   ProductDetailsResponseModel.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     status = json['status'];
//     errors = json['errors'] != null ? Errors.fromJson(json['errors']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['message'] = message;
//     data['status'] = status;
//     if (errors != null) {
//       data['errors'] = errors!.toJson();
//     }
//     return data;
//   }
// }

// class Errors {
//   List<String>? productId;

//   Errors({this.productId});

//   Errors.fromJson(Map<String, dynamic> json) {
//     productId = json['product_id'].cast<String>();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['product_id'] = productId;
//     return data;
//   }
// }


class ProductDetailsResponseModel {
  String? message;
  int? status;
  Data? data;

  ProductDetailsResponseModel({this.message, this.status, this.data});

  ProductDetailsResponseModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? name;
  int? productCategoryId;
  int? productBrandId;
  String? price;
  String? description;
  String? mainImage;
  List<String>? images;
  int? totalRate;
  int? quantity;
  bool? favorite;
  Category? category;
  Brand? brand;
  List? reviews;

  Data(
      {this.id,
      this.name,
      this.productCategoryId,
      this.productBrandId,
      this.price,
      this.description,
      this.mainImage,
      this.images,
      this.totalRate,
      this.quantity,
      this.favorite,
      this.category,
      this.brand,
      this.reviews});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    productCategoryId = json['product_category_id'];
    productBrandId = json['product_brand_id'];
    price = json['price'];
    description = json['description'];
    mainImage = json['main_image'];
    images = json['images'].cast<String>();
    totalRate = json['total_rate'];
    quantity = json['quantity'];
    favorite = json['favorite'];
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    if (json['reviews'] != null) {
      reviews = <Null>[];
      json['reviews'].forEach((v) {
        reviews!.add( (v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['product_category_id'] = productCategoryId;
    data['product_brand_id'] = productBrandId;
    data['price'] = price;
    data['description'] = description;
    data['main_image'] = mainImage;
    data['images'] = images;
    data['total_rate'] = totalRate;
    data['quantity'] = quantity;
    data['favorite'] = favorite;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (brand != null) {
      data['brand'] = brand!.toJson();
    }
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? image;
  String? color;
  String? type;

  Category({this.id, this.name, this.image, this.color, this.type});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    color = json['color'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['color'] = color;
    data['type'] = type;
    return data;
  }
}

class Brand {
  int? id;
  String? name;
  String? image;

  Brand({this.id, this.name, this.image});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}
