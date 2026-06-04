import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/wishlist_model.dart';

class WishlistService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addToWishlist(WishlistModel wishlist) async {
    try {
      await _firestore.collection('wishlists').doc(wishlist.id).set(wishlist.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> removeFromWishlist(String wishlistId) async {
    try {
      await _firestore.collection('wishlists').doc(wishlistId).delete();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<WishlistModel>> getUserWishlist(String userId) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('wishlists')
          .where('userId', isEqualTo: userId)
          .get();
      return snapshot.docs
          .map((doc) => WishlistModel.fromJson({...doc.data() as Map<String, dynamic>, 'id': doc.id}))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> isInWishlist(String userId, String productId) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('wishlists')
          .where('userId', isEqualTo: userId)
          .where('productId', isEqualTo: productId)
          .get();
      return snapshot.docs.isNotEmpty;
    } catch (e) {
      rethrow;
    }
  }

  Stream<List<WishlistModel>> getUserWishlistStream(String userId) {
    return _firestore
        .collection('wishlists')
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => WishlistModel.fromJson({...doc.data() as Map<String, dynamic>, 'id': doc.id}))
            .toList());
  }
}
