class WishlistModel {
  final String id;
  final String userId;
  final String productId;
  final String productName;
  final double price;
  final String image;
  final DateTime addedAt;

  WishlistModel({
    required this.id,
    required this.userId,
    required this.productId,
    required this.productName,
    required this.price,
    required this.image,
    required this.addedAt,
  });

  factory WishlistModel.fromJson(Map<String, dynamic> json) {
    return WishlistModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      productId: json['productId'] as String,
      productName: json['productName'] as String,
      price: (json['price'] as num).toDouble(),
      image: json['image'] as String,
      addedAt: DateTime.parse(json['addedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'productId': productId,
      'productName': productName,
      'price': price,
      'image': image,
      'addedAt': addedAt.toIso8601String(),
    };
  }
}
