// ignore_for_file: prefer_const_constructors

import 'package:flutter/services.dart';
import 'package:quizz_ai/features/app/ai.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_ai/features/user_auth/presentation/pages/quiz_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
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
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            iconSize: 30.0,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Menü'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Ana Ekrana Dön'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Çıkış'),
              onTap: () {
                SystemNavigator.pop();
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo Resmi
                Image.asset(
                  'assets/main-logo.png', // asset yolumuz burada
                  height: 60,
                ),
                const SizedBox(height: 50.0),
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
                      width: 400.0,
                      height: 150.0,
                      child: TextField(
                        controller: myController,
                        maxLength: 350,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          hintText:
                              'Quiz oluşturmak istediğin konuyla alakalı bir kaç kelime gir', //Bu bölüme yazılan text bota yönlendirilecek.
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
                                .map<DropdownMenuItem<String>>((String value) {
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
                        builder: (context) =>
                            AIPage(initialMessage: "${myController.text} You are a ai for quiz app. Users will give a subject and you will create questions about that subject.Use emojis, one per sentence.Set the question length to a maximum of 5 paragraphs.Use Turkish language.Give the user 4 question options.   Use emoji per sentence in your explanation sentences.Give only 1 question.Dont give the true answer in questions phase.Tüm çıktıyı tek bir metin olarak ver.Kullanıcıya sadece soruyu ve cevapları yaz başka ekstra bir şey söyleme.* kullanma. A-B-C-D Eklemelerini yap."),
                      ),
                    );
                  }, //Oluştur butonu istenen metni ve zorluk seviyesini aı bota iletececek.
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 1.0),
                    backgroundColor: const Color(0xff0e402d),
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
      ),
    );
  }
}
