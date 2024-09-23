class FavouriteProductsResponseModel {
  String? message;
  int? status;
  List<Data>? data;

  FavouriteProductsResponseModel({this.message, this.status, this.data});

  FavouriteProductsResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? userId;
  List<Products>? products;
  List<Accessories>? accessories;

  Data({this.id, this.userId, this.products, this.accessories});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    if (json['accessories'] != null) {
      accessories = <Accessories>[];
      json['accessories'].forEach((v) {
        accessories!.add(Accessories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    if (accessories != null) {
      data['accessories'] = accessories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
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
  Brand? brand;

  Products(
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
      this.brand});

  Products.fromJson(Map<String, dynamic> json) {
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
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
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
    if (brand != null) {
      data['brand'] = brand!.toJson();
    }
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

class Accessories {
  int? id;
  String? name;
  String? description;
  String? image;
  List<String>? images;
  int? totalRate;
  String? price;
  int? quantity;
  int? categoryId;
  bool? favorite;

  Accessories(
      {this.id,
      this.name,
      this.description,
      this.image,
      this.images,
      this.totalRate,
      this.price,
      this.quantity,
      this.categoryId,
      this.favorite});

  Accessories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    images = json['images'].cast<String>();
    totalRate = json['total_rate'];
    price = json['price'];
    quantity = json['quantity'];
    categoryId = json['category_id'];
    favorite = json['favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['images'] = images;
    data['total_rate'] = totalRate;
    data['price'] = price;
    data['quantity'] = quantity;
    data['category_id'] = categoryId;
    data['favorite'] = favorite;
    return data;
  }
}
