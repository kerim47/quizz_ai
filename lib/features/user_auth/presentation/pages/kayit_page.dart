import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../global/common/toast.dart';
import '../../firebase_auth_implementation/firebase_auth_services.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuthService _auth = FirebaseAuthService();

  bool isSigningUp = false;

  @override
  void dispose() {
    // usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _signUpWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        // Kullanıcı oturum açmayı iptal etti
        debugPrint("HATA: Kullanıcı oturum açmayı iptal etti");
        return;
      }
      debugPrint('HATA: Buraya kadar hata yok GoogleSignInAccount');

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      debugPrint('HATA: Buraya kadar hata yok GoogleSignInAuthentication');
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      debugPrint('HATA: Buraya kadar hata yok');

      final UserCredential userCredential =
          // await _auth.signInWithCredential(credential);
          await _auth.getAuth().signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user != null) {
        debugPrint('HATA: Google sign-in successful: ${user.email}');
        // Kullanıcı başarıyla kaydoldu, burada yönlendirme yapabilirsiniz
      }
    } catch (e) {
      debugPrint('HATA: Error during Google sign-in: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 50),
              Image.asset(
                'assets/quizz_ai_logo/alt-logo-2.png', // Change this to the path of your logo image
                height: 60,
                color: Colors.black,
              ),
              const SizedBox(height: 32),
              Text(
                'Bir hesap olusturun',
                style: GoogleFonts.lato(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Bu uygulamaya kaydolmak için e-postanızı girin',
                style: GoogleFonts.lato(
                  fontSize: 16,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'email@domain.com',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(
                                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                            .hasMatch(value)) {
                          return 'Please provide a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller:
                          passwordController, // controller ismini emailController'dan passwordController'a değiştirdim.
                      decoration: InputDecoration(
                        hintText: '********',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      obscureText:
                          true, // Şifreyi gizlemek için bu özelliği ekledim.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          // Handle email sign up
                          _signUp();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Kayıt Ol',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            color: Colors.black,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'veya ile devam edin',
                            style: GoogleFonts.lato(color: Colors.black),
                          ),
                        ),
                        const Expanded(
                          child: Divider(
                            color: Colors.black,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () async {
                            await _signUpWithGoogle();
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,
                            side: const BorderSide(color: Colors.black),
                            padding: const EdgeInsets.symmetric(horizontal: 26),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          icon: const Icon(FontAwesomeIcons.google),
                          label: const Text('Google'),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pushNamed(context, "/login");
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,
                            side: const BorderSide(color: Colors.black),
                            padding: const EdgeInsets.symmetric(horizontal: 26),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          icon: const Icon(Icons.login),
                          label: const Text('Giriş Yap'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Kayıt Ol\'a tıklayarak Hizmet Sartlarımızı ve Gizlilik Politikamızı kabul etmis olursunuz.',
                style: GoogleFonts.lato(
                  fontSize: 12,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signUp() async {
    setState(() {
      isSigningUp = true;
    });

    // ignore: unused_local_variable
    // String username = usernameController.text;
    String email = emailController.text;
    String password = passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    setState(() {
      isSigningUp = false;
    });

    if (user != null) {
      showToast(message: "Kullanıcı başarıyla kaydedildi");
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, "/login");
      // Navigator.pushAndRemoveUntil(context, newRoute, predicate)
    } else {
      // showToast(message: "Some error happend");
    }
  }
}
