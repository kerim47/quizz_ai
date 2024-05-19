import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_pixels/image_pixels.dart';
import 'package:quizz_ai/global/common/colors.dart';

class Welcome1 extends StatelessWidget {
  const Welcome1({super.key});

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
            // ImagePixels(
            //   imageProvider:
            //       const AssetImage('assets/quizz_ai_logo/main-logo.png'),
            //   builder: (context, img) {
            //     Color topLeftColor = img.pixelColorAt!(100, 100);
            //     debugPrint("Pixel color at top-left: $topLeftColor.");
            //     return Text("Pixel color at top-left: $topLeftColor.");
            //   },
            // ),
            const SizedBox(height: 20),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  daireWidget(DaireDurumu.yanik),
                  const SizedBox(width: 10),
                  daireWidget(DaireDurumu.sonuk),
                  const SizedBox(width: 10),
                  daireWidget(DaireDurumu.sonuk),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.green,
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

enum DaireDurumu { yanik, sonuk }

Widget daireWidget(DaireDurumu durum) {
  Color renk;
  switch (durum) {
    case DaireDurumu.yanik:
      renk = Colors.green;
      break;
    case DaireDurumu.sonuk:
      renk = Colors.white;
      break;
  }
  return Container(
    width: 10,
    height: 10,
    decoration: BoxDecoration(
      color: renk,
      shape: BoxShape.circle,
    ),
  );
}
