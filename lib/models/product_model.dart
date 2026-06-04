class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final double? discountPrice;
  final String category;
  final List<String> images;
  final double rating;
  final int reviews;
  final int stock;
  final List<String> colors;
  final List<String> sizes;
  final bool isFeatured;
  final bool isPopular;
  final DateTime createdAt;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.discountPrice,
    required this.category,
    required this.images,
    this.rating = 0,
    this.reviews = 0,
    this.stock = 0,
    this.colors = const [],
    this.sizes = const [],
    this.isFeatured = false,
    this.isPopular = false,
    required this.createdAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      discountPrice: json['discountPrice'] != null ? (json['discountPrice'] as num).toDouble() : null,
      category: json['category'] as String,
      images: List<String>.from(json['images'] as List),
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      reviews: json['reviews'] as int? ?? 0,
      stock: json['stock'] as int? ?? 0,
      colors: List<String>.from(json['colors'] as List? ?? []),
      sizes: List<String>.from(json['sizes'] as List? ?? []),
      isFeatured: json['isFeatured'] as bool? ?? false,
      isPopular: json['isPopular'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'discountPrice': discountPrice,
      'category': category,
      'images': images,
      'rating': rating,
      'reviews': reviews,
      'stock': stock,
      'colors': colors,
      'sizes': sizes,
      'isFeatured': isFeatured,
      'isPopular': isPopular,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  double get discountedPrice => discountPrice ?? price;
  
  double get discountPercentage {
    if (discountPrice == null) return 0;
    return ((price - discountPrice!) / price * 100).round().toDouble();
  }
}
