import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quizz_ai/features/user_auth/presentation/pages/landing_page.dart';
import 'package:quizz_ai/features/user_auth/presentation/pages/quiz_final_page.dart';
import 'package:quizz_ai/global/common/consts.dart';

import 'features/user_auth/presentation/pages/login_page.dart';
import 'features/user_auth/presentation/pages/onboard_1.dart';
import 'features/user_auth/presentation/pages/onboard_2.dart';
import 'features/user_auth/presentation/pages/quiz_page.dart';
import 'features/user_auth/presentation/pages/home_page.dart';
import 'features/user_auth/presentation/pages/onboard_3.dart';
import 'features/user_auth/presentation/pages/signup_page.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

import 'firebase_options.dart';

Future main() async {
  Gemini.init(
    apiKey: GEMINI_API_KEY,
  );
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
      title: 'Quizz AI',
      routes: {
        '/': (context) => const OnboardingScreen1(), // ilk başladığında bu kod çalışacak
        // '/': (context) => SignUpScreen(),
        '/login': (context) => const SignInScreen(),
        '/signup': (context) => SignUpScreen(),
        '/home': (context) => const HomePage(),
        '/onboard1': (context) => const OnboardingScreen1(),
        '/onboard2': (context) => const OnboardingScreen2(),
        '/onboard3': (context) => const OnboardingScreen3(),
        '/quiz': (context) =>  QuizPage(),
        'landing': (context) => const LandingPage(),
        'final': (context) => const QuizResultPage(),
      },
    );
  }
}
