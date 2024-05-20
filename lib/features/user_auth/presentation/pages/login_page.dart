import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../global/common/toast.dart';
import '../../firebase_auth_implementation/firebase_auth_services.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuthService _auth = FirebaseAuthService();
  bool _rememberMe = false;
  bool _isSigning = true;

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  void _login() {
    String email = _emailController.text;
    String password = _passwordController.text;
    // Burada giriş işlemleri yapılacak
    if (kDebugMode) {
      print('E-posta: $email');
    }
    if (kDebugMode) {
      print('Şifre: $password');
    }
  }

  void _googleSignInMethod() async {
    try {
      await _googleSignIn.signIn();
      if (kDebugMode) {
        print('Google ile giriş yapıldı.');
      }
    } catch (error) {
      if (kDebugMode) {
        print('Google ile giriş başarısız: $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          true, // Klavye açıldığında ekranı yeniden boyutlandır
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pop(); // Bir önceki sayfaya geri dön
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                      iconSize: 40,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/quizz_ai_logo/alt-logo-4.png',
                height: 60,
                color: Colors.black,
              ),
              const SizedBox(height: 40),
              const Text(
                "Giriş Yap",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'E-posta adresinizi giriniz',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Şifrenizi giriniz',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _signIn,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Yuvarlak köşeler
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 12),
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Giriş Yap'),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton.icon(
                onPressed: _googleSignInMethod,
                icon: const Icon(FontAwesomeIcons.google),
                label: const Text(
                  'Google ile Giriş Yap',
                  style: TextStyle(fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Yuvarlak köşeler
                  ),
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 12),
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                children: <Widget>[
                  Checkbox(
                    value: _rememberMe,
                    checkColor: Colors.white,
                    activeColor: Colors.black,
                    onChanged: (bool? value) {
                      setState(() {
                        _rememberMe = value ?? false;
                      });
                    },
                  ),
                  const Text('Beni Hatırla'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signIn() async {
    setState(() {
      _isSigning = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
      _isSigning = false;
    });

    if (user != null) {
      showToast(message: "User is successfully signed in");
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, "/quiz");
    } else {
      showToast(message: "some error occured");
    }
  }
}
