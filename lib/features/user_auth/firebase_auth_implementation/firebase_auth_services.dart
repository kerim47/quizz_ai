import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../../../global/common/toast.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseAuth getAuth() {
    return _auth;
  }

  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        showToast(message: 'Boyle bir email zaten mevcut');
      } else if (e.code == 'network-request-failed') {
        showToast(
            message:
                'Doğrulanamıyor...\nLütfen internet bağlantınızı kontrol ediniz.');
      } else {
        debugPrint("HATA KODU: ${e.code}");
        // showToast(message: 'An error occurred: ${e.code}');
      }
    }
    return null;
  }

  String? validateEmail(String email) {
    if (RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(email)) {
      return null;
    } else {
      return "Please provide a valid email";
    }
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      debugPrint("**************************************");
      String? res = validateEmail(email);
      if (res == null) {
        debugPrint('Emailde bir sorun yok firebasede var');
      } else {
        debugPrint(res);
      }
      debugPrint("**************************************");
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      debugPrint("**************************************");
      debugPrint(e.code);
      debugPrint("**************************************");
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        showToast(message: 'Invalid email or password.');
      } else if (e.code == 'network-request-failed') {
        showToast(
            message:
                'Doğrulanamıyor...\nLütfen internet bağlantınızı kontrol ediniz.');
      } else if (e.code == 'too-many-requests') {
        showToast(
            message:
                'Çok fazla deneme yaptınız. Lütfen daha sonra tekrar deneyin.');
      } else if (e.code == 'invalid-email') {
        showToast(message: 'Geçersiz email adresi');
      } else if (e.code == 'invalid-password') {
        showToast(message: 'Geçersiz şifre');
      } else if (e.code == 'invalid-credential') {
        showToast(message: 'Boyle bir kullanıcı yok lütfen kayıt olun');
      } else {
        showToast(message: 'An error occurred: ${e.code}');
      }
    }
    return null;
  }
}
