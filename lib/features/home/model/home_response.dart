class HomeResponseModel {
  String? message;
  int? status;
  Data? data;

  HomeResponseModel({this.message, this.status, this.data});

  HomeResponseModel.fromJson(Map<String, dynamic> json) {
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
  Whatsapp? whatsapp;
  List? banners;
  List<Categories>? categories;
  List<Products>? products;
  List<Accssories>? accssories;
  List<Settings>? settings;
  String? fName;
  String? lName;

  Data(
      {this.whatsapp,
      this.banners,
      this.categories,
      this.products,
      this.accssories,
      this.settings,
      this.fName,
      this.lName});

  Data.fromJson(Map<String, dynamic> json) {
    whatsapp =
        json['whatsapp'] != null ? Whatsapp.fromJson(json['whatsapp']) : null;
    if (json['banners'] != null) {
      banners = <Null>[];
      json['banners'].forEach((v) {
        banners!.add(v);
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    if (json['accssories'] != null) {
      accssories = <Accssories>[];
      json['accssories'].forEach((v) {
        accssories!.add(Accssories.fromJson(v));
      });
    }
    if (json['settings'] != null) {
      settings = <Settings>[];
      json['settings'].forEach((v) {
        settings!.add(Settings.fromJson(v));
      });
    }
    fName = json['f_name'];
    lName = json['l_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (whatsapp != null) {
      data['whatsapp'] = whatsapp!.toJson();
    }
    if (banners != null) {
      data['banners'] = banners!.map((v) => v?.toJson()).toList();
    }
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    if (accssories != null) {
      data['accssories'] = accssories!.map((v) => v.toJson()).toList();
    }
    if (settings != null) {
      data['settings'] = settings!.map((v) => v.toJson()).toList();
    }
    data['f_name'] = fName;
    data['l_name'] = lName;
    return data;
  }
}

class Whatsapp {
  String? url;

  Whatsapp({this.url});

  Whatsapp.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    return data;
  }
}

class Categories {
  int? id;
  String? name;
  String? image;
  String? color;

  Categories({this.id, this.name, this.image, this.color});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['color'] = color;
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

class Accssories {
  int? id;
  String? name;
  String? description;
  String? image;
  List<String>? images;
  int? totalRate;
  String? price;
  int? quantity;
  bool? favorite;

  Accssories(
      {this.id,
      this.name,
      this.description,
      this.image,
      this.images,
      this.totalRate,
      this.price,
      this.quantity,
      this.favorite});

  Accssories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    images = json['images'].cast<String>();
    totalRate = json['total_rate'];
    price = json['price'];
    quantity = json['quantity'];
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
    data['favorite'] = favorite;
    return data;
  }
}

class Settings {
  int? id;
  String? name;
  String? value;

  Settings({this.id, this.name, this.value});

  Settings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['value'] = value;
    return data;
  }
}
