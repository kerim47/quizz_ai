import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContributorsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EMEĞİ GEÇENLER'),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'EMEĞİ GEÇENLER',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),
              ),
            ),
            const SizedBox(height: 20),
             Text(
              'YAVUZ KARAKUŞ',
              style: GoogleFonts.poppins(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
             Text(
              'ABDÜLKERİM AKAN',
              style: GoogleFonts.poppins(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
             Text(
              'HÜSEYİN ENES ERTÜRK',
              style: GoogleFonts.poppins(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
