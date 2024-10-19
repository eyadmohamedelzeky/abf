class CardProductsResponse {
  String? message;
  int? status;
  Data? data;

  CardProductsResponse({this.message, this.status, this.data});

  CardProductsResponse.fromJson(Map<String, dynamic> json) {
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
  int? userId;
  String? total;
  String? discountValue;
  String? addedValue;
  int? promoCodeId;
  String? grandTotal;
  int? addressId;
  List<CartProducts>? cartProducts;
  List<Null>? cartAccessories;

  Data(
      {this.id,
      this.userId,
      this.total,
      this.discountValue,
      this.addedValue,
      this.promoCodeId,
      this.grandTotal,
      this.addressId,
      this.cartProducts,
      this.cartAccessories});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    total = json['total'];
    discountValue = json['discount_value'];
    addedValue = json['added_value'];
    promoCodeId = json['promo_code_id'];
    grandTotal = json['grand_total'];
    addressId = json['address_id'];
    if (json['cart_products'] != null) {
      cartProducts = <CartProducts>[];
      json['cart_products'].forEach((v) {
        cartProducts!.add(CartProducts.fromJson(v));
      });
    }
    if (json['cart_accessories'] != null) {
      cartAccessories = <Null>[];
      json['cart_accessories'].forEach((v) {
        cartAccessories!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['total'] = total;
    data['discount_value'] = discountValue;
    data['added_value'] = addedValue;
    data['promo_code_id'] = promoCodeId;
    data['grand_total'] = grandTotal;
    data['address_id'] = addressId;
    if (cartProducts != null) {
      data['cart_products'] = cartProducts!.map((v) => v.toJson()).toList();
    }
    if (cartAccessories != null) {
      data['cart_accessories'] = cartAccessories!.map((v) => v).toList();
    }
    return data;
  }
}

class CartProducts {
  int? id;
  int? cartId;
  int? quantity;
  int? productId;
  int? addsProductId;
  Product? product;
  Add? add;

  CartProducts(
      {this.id,
      this.cartId,
      this.quantity,
      this.productId,
      this.addsProductId,
      this.product,
      this.add});

  CartProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cartId = json['cart_id'];
    quantity = json['quantity'];
    productId = json['product_id'];
    addsProductId = json['adds_product_id'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
    add = json['add'] != null ? Add.fromJson(json['add']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cart_id'] = cartId;
    data['quantity'] = quantity;
    data['product_id'] = productId;
    data['adds_product_id'] = addsProductId;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    if (add != null) {
      data['add'] = add!.toJson();
    }
    return data;
  }
}

class Product {
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
  Brand? brand;

  Product(
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
      this.brand});

  Product.fromJson(Map<String, dynamic> json) {
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

class Add {
  int? id;
  String? name;
  String? price;
  int? typeId;

  Add({this.id, this.name, this.price, this.typeId});

  Add.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    typeId = json['type_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['type_id'] = typeId;
    return data;
  }
}
