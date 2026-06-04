class CartItemModel {
  final String id;
  final String productId;
  final String productName;
  final double price;
  final String image;
  final int quantity;
  final String? selectedColor;
  final String? selectedSize;

  CartItemModel({
    required this.id,
    required this.productId,
    required this.productName,
    required this.price,
    required this.image,
    required this.quantity,
    this.selectedColor,
    this.selectedSize,
  });

  double get totalPrice => price * quantity;

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['id'] as String,
      productId: json['productId'] as String,
      productName: json['productName'] as String,
      price: (json['price'] as num).toDouble(),
      image: json['image'] as String,
      quantity: json['quantity'] as int,
      selectedColor: json['selectedColor'] as String?,
      selectedSize: json['selectedSize'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId': productId,
      'productName': productName,
      'price': price,
      'image': image,
      'quantity': quantity,
      'selectedColor': selectedColor,
      'selectedSize': selectedSize,
    };
  }

  CartItemModel copyWith({
    String? id,
    String? productId,
    String? productName,
    double? price,
    String? image,
    int? quantity,
    String? selectedColor,
    String? selectedSize,
  }) {
    return CartItemModel(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      price: price ?? this.price,
      image: image ?? this.image,
      quantity: quantity ?? this.quantity,
      selectedColor: selectedColor ?? this.selectedColor,
      selectedSize: selectedSize ?? this.selectedSize,
    );
  }
}
