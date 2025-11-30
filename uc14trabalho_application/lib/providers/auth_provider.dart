import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? _user;
  User? get user => _user;

  bool get isLogged => _user != null;

  AuthProvider() {
    // Escuta automaticamente mudanças de login e logout
    _auth.authStateChanges().listen((user) {
      _user = user;
      notifyListeners();
    });
  }

  // ----------------------
  // LOGIN
  // ----------------------
  Future<String?> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return null; // Sucesso
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // ----------------------
  // CADASTRO
  // ----------------------
  Future<String?> register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return null; // Sucesso
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // ----------------------
  // LOGOUT
  // ----------------------
  Future<void> logout() async {
    await _auth.signOut();
  }
}
