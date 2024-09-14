class FilterRequestModel {
  final int categoryId;
  final List<int> brandsId;
  final int bestseller;
  final int price;
  final int rate;
  FilterRequestModel({
    required this.categoryId,
    required this.brandsId,
    required this.bestseller,
    required this.price,
    required this.rate,
  });

  factory FilterRequestModel.fromJson(Map<String, dynamic> json) {
    return FilterRequestModel(
      categoryId: json['category_id'] as int,
      brandsId: List<int>.from(json['brands_id'] as List),
      bestseller: json['bestseller'] as int,
      price: json['price'] as int,
      rate: json['rate'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category_id': categoryId,
      'brands_id': brandsId,
      'bestseller': bestseller,
      'price': price,
      'rate': rate,
    };
  }

  // Method to create a copy of the Product with updated fields
  FilterRequestModel copyWith({
    int? categoryId,
    List<int>? brandsId,
    int? bestseller,
    int? price,
    int? rate,
  }) {
    return FilterRequestModel(
      categoryId: categoryId ?? this.categoryId,
      brandsId: brandsId ?? this.brandsId,
      bestseller: bestseller ?? this.bestseller,
      price: price ?? this.price,
      rate: rate ?? this.rate,
    );
  }
}
