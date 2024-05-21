import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quizz_ai/features/app/ai_output_notifier.dart';
import 'package:quizz_ai/features/user_auth/presentation/pages/landing_page.dart';
import '../../../app/ai.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _counter = 1000;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          _timer.cancel();
          showTimeUpDialog();
        }
      });
    });
  }

  void showTimeUpDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Süreniz Bitti'),
          content:
              const Text('Süreniz doldu, ana menüye yönlendiriliyorsunuz.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Tamam'),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const LandingPage()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0e402d),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.hourglass_empty, color: Colors.white),
                      const SizedBox(width: 8),
                      Text('$_counter',
                          style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LandingPage()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Consumer<AiOutputNotifier>(
              builder: (context, aiOutputNotifier, child) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.all(5.0),
                      child: Center(
                        child: Text(
                          aiOutputNotifier.aiOutput,
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Cevaplar'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ElevatedButton(
                              child: const Text('A'),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const AIPage(
                                        initialMessage:
                                            "A => Bu şıkkın doğrulunu kontrol et ve çok kısa bir paragrafla soruyu açıkla."),
                                  ),
                                );
                              },
                            ),
                            ElevatedButton(
                              child: const Text('B'),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const AIPage(
                                        initialMessage:
                                            "B => Bu şıkkın doğrulunu kontrol et ve çok kısa bir paragrafla soruyu açıkla."),
                                  ),
                                );
                              },
                            ),
                            ElevatedButton(
                              child: const Text('C'),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const AIPage(
                                        initialMessage:
                                            "C => Bu şıkkın doğrulunu kontrol et ve çok kısa bir paragrafla soruyu açıkla."),
                                  ),
                                );
                              },
                            ),
                            ElevatedButton(
                              child: const Text('D'),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const AIPage(
                                        initialMessage:
                                            "D => Bu şıkkın doğrulunu kontrol et ve çok kısa bir paragrafla soruyu açıkla."),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  backgroundColor: const Color(0xff0e402d),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  'Cevapla',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
