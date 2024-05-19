import 'package:flutter/material.dart';
import 'package:quizz_ai/features/user_auth/presentation/widgets/indicator_row.dart';
import 'package:quizz_ai/global/common/colors.dart';

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const SizedBox(height: 40), // Space from the top
                  Image.asset(
                    'assets/quizz_ai_elements/alt-logo-3.png',
                    width: 120,
                    height: 120,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'İstersen profiline gidip\neski quizlerine erişebilirsin',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Geçmiş quizlerine bakıp onları telefonuna\nindirmek istersen profilini ziyaret etmeyi\nunutma.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    'Ama her şeyden önce...\nbir hesap oluştur bakalım.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  IndicatorRow(indicatorStatus: IndicatorStatus.third),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/signup");
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: backgroundColor,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 12),
                    ),
                    child: const Text(
                      'Hesap oluştur',
                      style: TextStyle(
                        color: backgroundColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20), // Space from the bottom
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
