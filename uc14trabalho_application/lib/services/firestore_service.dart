import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/item_model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveFavorite(String uid, ItemModel item) async {
    await _db.collection('users').doc(uid)
      .collection('favorites').doc(item.id).set(item.toMap());
  }

  Future<void> removeFavorite(String uid, String itemId) async {
    await _db.collection('users').doc(uid)
      .collection('favorites').doc(itemId).delete();
  }

  Stream<List<ItemModel>> streamFavorites(String uid) {
    return _db.collection('users').doc(uid)
      .collection('favorites').snapshots().map((snap) =>
        snap.docs.map((d) => ItemModel.fromJson(d.data())).toList());
  }
}
