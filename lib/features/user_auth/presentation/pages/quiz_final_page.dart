import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizResultPage extends StatelessWidget {
  const QuizResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0e402d),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  // Ekranı kapatma işlemi burada yapılabilir
                },
              ),
            ),
            const SizedBox(height: 40),
            Text(
              'Tebrikler!',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Icon(
              Icons.check_circle,
              color: Color(0xFF67A834),
              size: 50,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Skorun',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF67A834),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '2/4',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(
              'assets/alt-logo.png', // asset yolu
              width: 200,
              height: 50,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Geri bildirim verme işlemi burada yapılabilir
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.feedback, color: Colors.white),
                    const SizedBox(width: 8),
                    Text(
                      'Geri bildirim verin',
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
