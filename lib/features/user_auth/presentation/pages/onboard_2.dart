import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizz_ai/features/user_auth/presentation/widgets/indicator_row.dart';
import 'package:quizz_ai/global/common/colors.dart';
import 'dart:math' as math;

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 100), // Üst boşluk
              // Logo veya simge
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/quizz_ai_elements/alt-logo-3.png',
                  height: 100,
                  width: 100,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Stack(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 110,
                        ), // Add space to position the image freely
                        Flexible(
                          child: Text(
                            'eğitilmiş bir yapay zeka modelidir',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // This is the image you want to position freely
                    Positioned(
                      top: 10,
                      left: 0,
                      child: Image.asset(
                        'assets/quizz_ai_logo/alt-logo.png',
                        width: 100,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(10),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text:
                            'Bilginin gücünü elinde tutmak isteyenler için tasarlanmıştır. Yapman gereken tek şey "',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      WidgetSpan(
                          child: SizedBox(
                        width: 20.0,
                        child: SvgPicture.asset(
                          alignment: Alignment.bottomCenter,
                          height: 25,
                          width: 25,
                          'assets/quizz_ai_elements/SVGs/generate-icon.svg',
                          // ignore: deprecated_member_use
                          color: Colors.white,
                          semanticsLabel: 'bg image',
                        ),
                      )),
                      const TextSpan(
                        text: '" ikonlu butona basmak...',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 60,
                    height: 20,
                  ),
                  Transform.rotate(
                    angle: 0.0,
                    child: SvgPicture.asset(
                      height: 50,
                      width: 50,
                      'assets/quizz_ai_elements/SVGs/arrow-l-1.svg',
                      // ignore: deprecated_member_use
                      color: Colors.white,
                      semanticsLabel: 'bg image',
                    ),
                  ),
                  const SizedBox(width: 20),
                  Transform.rotate(
                    angle: -math.pi / 2.3,
                    child: SvgPicture.asset(
                      height: 50,
                      width: 50,
                      'assets/quizz_ai_elements/SVGs/arrow-l-2.svg',
                      // ignore: deprecated_member_use
                      color: Colors.white,
                      semanticsLabel: 'bg image',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 150),
              Center(
                child: IndicatorRow(
                  indicatorStatus: IndicatorStatus.second,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/onboard3");
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: backgroundColor,
                  backgroundColor: Colors.white, // Buton metninin rengi
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Yuvarlak köşeler
                  ),
                  padding:
                    const EdgeInsets.symmetric(horizontal: 120, vertical: 12),
                ),
                child: const Text('Sonraki'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}