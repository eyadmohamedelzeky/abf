class ProductByCategoryResponseModel {
  String? message;
  int? status;
  DataProductByCategoryResponseModel? data;

  ProductByCategoryResponseModel({this.message, this.status, this.data});

  ProductByCategoryResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null
        ? DataProductByCategoryResponseModel.fromJson(json['data'])
        : null;
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

class DataProductByCategoryResponseModel {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  DataProductByCategoryResponseModel(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  DataProductByCategoryResponseModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    if (links != null) {
      data['links'] = links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    data['prev_page_url'] = prevPageUrl;
    data['to'] = to;
    data['total'] = total;
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
      this.brand});

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
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
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
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (brand != null) {
      data['brand'] = brand!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? image;
  String? color;

  Category({this.id, this.name, this.image, this.color});

  Category.fromJson(Map<String, dynamic> json) {
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

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }
}
