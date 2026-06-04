import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product_model.dart';

class ProductService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addProduct(ProductModel product) async {
    try {
      await _firestore.collection('products').doc(product.id).set(product.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addMultipleProducts(List<ProductModel> products) async {
    try {
      WriteBatch batch = _firestore.batch();
      for (ProductModel product in products) {
        batch.set(_firestore.collection('products').doc(product.id), product.toJson());
      }
      await batch.commit();
    } catch (e) {
      rethrow;
    }
  }

  Future<ProductModel?> getProduct(String productId) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('products').doc(productId).get();
      if (doc.exists) {
        return ProductModel.fromJson(doc.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ProductModel>> getAllProducts() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('products').get();
      return snapshot.docs.map((doc) => ProductModel.fromJson(doc.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('products')
          .where('isFeatured', isEqualTo: true)
          .limit(10)
          .get();
      return snapshot.docs.map((doc) => ProductModel.fromJson(doc.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ProductModel>> getPopularProducts() async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('products')
          .where('isPopular', isEqualTo: true)
          .limit(10)
          .get();
      return snapshot.docs.map((doc) => ProductModel.fromJson(doc.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ProductModel>> getProductsByCategory(String category) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('products')
          .where('category', isEqualTo: category)
          .get();
      return snapshot.docs.map((doc) => ProductModel.fromJson(doc.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ProductModel>> searchProducts(String query) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('products')
          .where('name', isGreaterThanOrEqualTo: query)
          .where('name', isLessThanOrEqualTo: query + '\uf8ff')
          .get();
      return snapshot.docs.map((doc) => ProductModel.fromJson(doc.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Stream<List<ProductModel>> getProductsStream() {
    return _firestore.collection('products').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => ProductModel.fromJson(doc.data() as Map<String, dynamic>)).toList());
  }
}
