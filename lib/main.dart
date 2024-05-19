import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quizz_ai/features/user_auth/presentation/pages/ex.dart';
import 'package:quizz_ai/features/user_auth/presentation/pages/welcome_1.dart';
import 'features/app/splash_screen/splash_screen.dart';
import 'features/user_auth/presentation/pages/home_page.dart';
import 'features/user_auth/presentation/pages/login_page.dart';
import 'features/user_auth/presentation/pages/sign_up_page.dart'; // Import Firebase Auth

import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Firebase',
      routes: {
        '/': (context) => const Welcome1(),
        // '/': (context) => const SplashScreen(
        //       // Here, you can decide whether to show the LoginPage or HomePage based on user authentication
        //       child: LoginPage(),
        //     ),
        '/login': (context) => const LoginPage(),
        '/signUp': (context) => const SignUpPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
