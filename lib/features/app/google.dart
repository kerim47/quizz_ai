import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        // Kullanıcı giriş yapmadan çıktı
        return null;
      }

      // ignore: unnecessary_nullable_for_final_variable_declarations
      final GoogleSignInAuthentication? googleAuth =
          await googleUser.authentication;

      if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth!.accessToken,
          idToken: googleAuth.idToken,
        );

        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        return userCredential.user;
      } else {
        throw FirebaseAuthException(
          code: 'ERROR_MISSING_GOOGLE_AUTH_TOKEN',
          message: 'Google auth token is missing',
        );
      }
    } on FirebaseAuthException catch (e) {
      // Firebase hatasını yakala ve handle et
      if (kDebugMode) {
        print('Firebase auth error: ${e.message}');
      }
      return null;
    } on Exception catch (e) {
      // Diğer hataları yakala ve handle et
      if (kDebugMode) {
        print('Error during Google sign-in: $e');
      }
      return null;
    }
  }

  Future<bool> signOutFromGoogle() async {
    try {
      await GoogleSignIn().signOut();
      await _auth.signOut();
      return true;
    } on Exception catch (_) {
      return false;
    }
  }
}
