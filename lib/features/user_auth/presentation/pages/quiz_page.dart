import 'package:quizz_ai/features/app/ai_output_notifier.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:quizz_ai/features/user_auth/presentation/pages/landing_page.dart';


// ignore: must_be_immutable
class QuizPage extends StatefulWidget {
   final AiOutputNotifier aiOutputNotifier = AiOutputNotifier();
  QuizPage({super.key});

  String _input = "";

  set input(String value) {
    _input = value;
  }

  @override
  // ignore: library_private_types_in_public_api
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _counter = 60;
  late Timer _timer;
  final int _currentQuestion = 1;
  final int _totalQuestions = 4;

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
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 22, 44, 23),
      body: SafeArea(
        child: Column(
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
                    onTap: () {
                      
                    },
                    child: IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LandingPage()));
                      },
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Soru $_currentQuestion/$_totalQuestions',
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AiOutputNotifier().aiOutput, //Buraya ai tarafından gelen mesaj yazılacak....
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    AnswerButton(
                        text: 'A',
                        textColor: const Color.fromARGB(255, 20, 89, 25),
                        onTap: () {}),
                    AnswerButton(
                        text: 'B',
                        textColor: const Color.fromARGB(255, 1, 41, 3),
                        onTap: () {}),
                    AnswerButton(
                        text: 'C',
                        textColor: const Color.fromARGB(255, 1, 41, 3),
                        onTap: () {}),
                    AnswerButton(
                        text: 'D',
                        textColor: const Color.fromARGB(255, 1, 41, 3),
                        onTap: () {}),

                    //Answer buttonlar ile aı botuna şıklar iletilecek.
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 100.0),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Cevapla Butonu işlevi
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    backgroundColor: Colors.black,
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      'Cevapla',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
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

class AnswerButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const AnswerButton(
      {super.key,
      required this.text,
      required this.onTap,
      required Color textColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            iconColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0))),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
