import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizz_ai/features/user_auth/presentation/widgets/indicator_row.dart';
import 'package:quizz_ai/global/common/colors.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/quizz_ai_logo/main-logo.png', height: 60),
            const SizedBox(height: 40),
            SvgPicture.asset(
              height: 200,
              width: 200,
              'assets/quizz_ai_elements/SVGs/bg-1.svg',
              // ignore: deprecated_member_use
              color: Colors.white30,
              semanticsLabel: 'bg image',
            ),
            const SizedBox(height: 20),
            const Text(
              'Hoş geldiniz',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Uygulamamızı anlamanız için\nküçük bir tura çıkalım mı?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: IndicatorRow(
                indicatorStatus: IndicatorStatus.first,
              ),
            ),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/onboard2");
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: backgroundColor,
                backgroundColor: Colors.white, // Buton metninin rengi
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Yuvarlak köşeler
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 12),
              ),
              child: const Text('Evet, Kesinlikle Çıkalım!'),
            ),
          ],
        ),
      ),
    );
  }
}