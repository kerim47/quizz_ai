import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quizz_ai/global/common/consts.dart';
import 'package:quizz_ai/global/common/toast.dart';

import '../../../app/question.dart';
import 'guiz_page.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final myController = TextEditingController();
  final Gemini gemini = Gemini.instance;
  String zorluk = 'Orta';
  Question? result = null;
  bool _loading = false;

  Future<void> writeResultToJson(String result) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/result.json');
      await file.writeAsString(result);
      debugPrint('Sonuç başarıyla yazıldı: ${file.path}');
    } catch (e) {
      debugPrint('Hata: $e');
    }
  }

  Future<void> readResultFromJson() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/result.json');
      String content = await file.readAsString();
      // var decode = jsonDecode(content);
      result = Question.fromJson(jsonDecode(content));
      if (kDebugMode) {
        print(result?.sorular?[0].soru);
        print('A) ${result?.sorular![0].secenekler?[0]}');
        print('B) ${result?.sorular![0].secenekler?[1]}');
        print('C) ${result?.sorular![0].secenekler?[2]}');
        print('D) ${result?.sorular![0].secenekler?[3]}');
        print(result?.sorular?[0].cevap);
      }
    } catch (e) {
      showToast(message: 'Bişeyler ters gitti: Lütfen tekrar deneyin');
      result = null;
    }
  }

  Future<void> generateQuiz() async {
    final inputText = myController.text;

    if (inputText.isEmpty) return;

    setState(() {
      _loading = true;
    });

    try {
      String answer = '';
      String question = myController.text;
      String allQuestion ='$question ile ilgili 4 soru 4 şık ve cevaplarını döndür. $prompt';
      gemini.streamGenerateContent(allQuestion).listen((event) {
        answer += event.output ?? '';
      }, onDone: () async {
        debugPrint('Cevap: $answer');
        final String son = answer
            .replaceAll('json', '')
            .replaceAll('```', '')
            .replaceAll('\n', '');
        debugPrint(son);
        await writeResultToJson(son);
        await readResultFromJson();
        setState(() {
          _loading = false;
        });
        if (result != null) {
          debugPrint('diğer sayfaya geçiliyor');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QuizPage(
                questions: result!,
              ),
            ),
          );
          debugPrint('diğer sayfaya geçildi');
        }
      });
    } catch (e) {
      setState(() {
        _loading = false;
      });
      debugPrint(e.toString());
    }
  }

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
                                  value: zorluk,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      zorluk = newValue!;
                                      if (kDebugMode) {
                                        print(newValue);
                                      }
                                    });
                                  },
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
                        onPressed: () async {
                          debugPrint(myController.text);
                          generateQuiz();
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
                            const SizedBox(width: 10.0),
                            if (_loading)
                              const SizedBox(
                                width: 20.0,
                                height: 20.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
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
