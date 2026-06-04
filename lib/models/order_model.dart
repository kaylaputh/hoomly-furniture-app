class OrderModel {
  final String id;
  final String userId;
  final List<OrderItemModel> items;
  final double totalPrice;
  final double shippingCost;
  final double taxPrice;
  final double finalPrice;
  final String status; // pending, processing, shipped, delivered, cancelled
  final String paymentMethod; // cod, ewallet, transfer
  final String paymentStatus; // pending, completed, failed
  final String? shippingAddress;
  final String? shippingCity;
  final String? shippingZipCode;
  final String? phoneNumber;
  final String? notes;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? deliveredAt;

  OrderModel({
    required this.id,
    required this.userId,
    required this.items,
    required this.totalPrice,
    this.shippingCost = 0,
    this.taxPrice = 0,
    required this.finalPrice,
    this.status = 'pending',
    this.paymentMethod = 'cod',
    this.paymentStatus = 'pending',
    this.shippingAddress,
    this.shippingCity,
    this.shippingZipCode,
    this.phoneNumber,
    this.notes,
    required this.createdAt,
    this.updatedAt,
    this.deliveredAt,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      items: (json['items'] as List).map((e) => OrderItemModel.fromJson(e)).toList(),
      totalPrice: (json['totalPrice'] as num).toDouble(),
      shippingCost: (json['shippingCost'] as num?)?.toDouble() ?? 0,
      taxPrice: (json['taxPrice'] as num?)?.toDouble() ?? 0,
      finalPrice: (json['finalPrice'] as num).toDouble(),
      status: json['status'] as String? ?? 'pending',
      paymentMethod: json['paymentMethod'] as String? ?? 'cod',
      paymentStatus: json['paymentStatus'] as String? ?? 'pending',
      shippingAddress: json['shippingAddress'] as String?,
      shippingCity: json['shippingCity'] as String?,
      shippingZipCode: json['shippingZipCode'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      deliveredAt: json['deliveredAt'] != null ? DateTime.parse(json['deliveredAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'items': items.map((e) => e.toJson()).toList(),
      'totalPrice': totalPrice,
      'shippingCost': shippingCost,
      'taxPrice': taxPrice,
      'finalPrice': finalPrice,
      'status': status,
      'paymentMethod': paymentMethod,
      'paymentStatus': paymentStatus,
      'shippingAddress': shippingAddress,
      'shippingCity': shippingCity,
      'shippingZipCode': shippingZipCode,
      'phoneNumber': phoneNumber,
      'notes': notes,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'deliveredAt': deliveredAt?.toIso8601String(),
    };
  }
}

class OrderItemModel {
  final String productId;
  final String productName;
  final double price;
  final int quantity;
  final String image;
  final String? color;
  final String? size;

  OrderItemModel({
    required this.productId,
    required this.productName,
    required this.price,
    required this.quantity,
    required this.image,
    this.color,
    this.size,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      productId: json['productId'] as String,
      productName: json['productName'] as String,
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'] as int,
      image: json['image'] as String,
      color: json['color'] as String?,
      size: json['size'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'productName': productName,
      'price': price,
      'quantity': quantity,
      'image': image,
      'color': color,
      'size': size,
    };
  }
}
