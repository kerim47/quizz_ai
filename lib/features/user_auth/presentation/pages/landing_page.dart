import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'guiz_page.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final myController = TextEditingController();

  @override
  void dispose() {
    // Controller'ı temizlemeyi unutmayın
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          iconSize: 30.0,
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              (Icons.account_circle),
            ),
            iconSize: 30.0,
            onPressed: () {},
          )
        ],
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(10.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Logo Resmi
                      Image.asset(
                        'assets/quizz_ai_logo/main-logo.png', // asset yolumuz burada
                        height: 60,
                      ),
                      const SizedBox(height: 40.0),
                      // Kullanılacak Metin
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kullanılacak Metin',
                            style: GoogleFonts.poppins(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          SizedBox(
                            width: double.infinity,
                            child: TextField(
                              controller: myController,
                              maxLength: 350,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(15),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                hintText:
                                    'Quiz oluşturmak istediğin konuyla alakalı bir kaç kelime gir',
                                hintStyle: GoogleFonts.poppins(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                              maxLines: 5,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      // Zorluk Derecesi
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Zorluk Derecesi',
                                  style: GoogleFonts.poppins(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                DropdownButtonFormField<String>(
                                  value: 'Orta',
                                  onChanged: (String? newValue) {},
                                  items: <String>['Kolay', 'Orta', 'Zor']
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: GoogleFonts.poppins(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: const BorderSide(
                                        color: Color.fromARGB(255, 1, 41, 3),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30.0),
                      // Quiz Oluştur Butonu
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QuizPage()));
                        }, // Oluştur butonu istenen metni ve zorluk seviyesini aı bota iletecek.
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 1.0),
                          backgroundColor: const Color.fromARGB(255, 1, 41, 3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.star, // Yıldız ikonu
                              color: Colors.white,
                            ),
                            const SizedBox(width: 10.0),
                            Text(
                              'Quiz Oluştur',
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              style: GoogleFonts.poppins(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
