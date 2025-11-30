import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ItemsProvider with ChangeNotifier {
  final _db = FirebaseFirestore.instance;

  List<Map<String, dynamic>> _items = [];
  List<Map<String, dynamic>> get items => _items;

  bool isLoading = false;

  ItemsProvider() {
    loadItems(); // carrega itens automaticamente
  }

  // -----------------------------
  //   CARREGAR ITENS (REALTIME)
  // -----------------------------
  void loadItems() {
    _db.collection("items").snapshots().listen((snapshot) {
      _items = snapshot.docs.map((doc) {
        return {"id": doc.id, ...doc.data()};
      }).toList();

      notifyListeners();
    });
  }

  // -----------------------------
  //   ADICIONAR ITEM
  // -----------------------------
  Future<String?> addItem(String title, String description) async {
    try {
      await _db.collection("items").add({
        "title": title,
        "description": description,
        "favorite": false,
        "createdAt": Timestamp.now(),
      });

      return null; // sucesso
    } catch (e) {
      return e.toString();
    }
  }

  // -----------------------------
  //   ATUALIZAR ITEM
  // -----------------------------
  Future<String?> updateItem(String id, Map<String, dynamic> data) async {
    try {
      await _db.collection("items").doc(id).update(data);
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  // -----------------------------
  //   REMOVER ITEM
  // -----------------------------
  Future<String?> deleteItem(String id) async {
    try {
      await _db.collection("items").doc(id).delete();
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  // -----------------------------
  //   FAVORITAR / DESFAVORITAR
  // -----------------------------
  Future<String?> toggleFavorite(String id, bool currentValue) async {
    try {
      await _db.collection("items").doc(id).update({"favorite": !currentValue});
      return null;
    } catch (e) {
      return e.toString();
    }
  }
}
