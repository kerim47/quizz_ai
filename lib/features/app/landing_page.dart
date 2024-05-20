import 'package:example_for_oua_ai/ai.dart';
import 'package:example_for_oua_ai/guiz_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const QuizScreen(),
    );
  }
}

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
                const SizedBox(height: 100.0),
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
                    AI().input = myController.text;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  QuizPage()));
                  }, //Oluştur butonu istenen metni ve zorluk seviyesini aı bota iletececek.
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
      ),
    );
  }
}
