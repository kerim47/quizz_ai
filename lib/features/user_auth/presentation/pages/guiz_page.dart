// // ignore_for_file: library_private_types_in_public_api

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../../../app/question.dart'; // Adjust import path as necessary

// class QuizPage extends StatefulWidget {
//   final Question questions;

//   const QuizPage({super.key, required this.questions});

//   @override
//   _QuizPageState createState() => _QuizPageState();
// }

// class _QuizPageState extends State<QuizPage> {
//   int _counter = 60;
//   late Timer _timer;
//   List<int> questionAnswers = [-1, -1, -1, -1];
//   int _currentQuestionIndex = 0; // Track current question index
//   int _correctAnswers = 0; // Track number of correct answers
//   int _incorrectAnswers = 0; // Track number of incorrect answers
//   bool _showResults = false; // Flag to show results

//   @override
//   void initState() {
//     super.initState();
//     _startTimer();
//   }

//   void _startTimer() {
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//         if (_counter > 0) {
//           _counter--;
//         } else {
//           _timer.cancel();
//           // Handle timer completion if needed
//         }
//       });
//     });
//   }

//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }

//   void _handleAnswer(String selectedAnswer) {
//     // Check if selected answer is correct
//     bool isCorrect = selectedAnswer ==
//         widget.questions.sorular![_currentQuestionIndex].cevap;

//     // Update answer status for the current question
//     setState(() {
//       questionAnswers[_currentQuestionIndex] = isCorrect ? 1 : 0;
//     });

//     // Update counters based on correctness
//     if (isCorrect) {
//       setState(() {
//         _correctAnswers++;
//       });
//     } else {
//       setState(() {
//         _incorrectAnswers++;
//       });
//     }

//     // Move to the next question or show results if all questions answered
//     if (_currentQuestionIndex < widget.questions.sorular!.length - 1) {
//       Timer(const Duration(seconds: 2), () {
//         setState(() {
//           _currentQuestionIndex++;
//         });
//       });
//     } else {
//       Timer(const Duration(seconds: 2), () {
//         setState(() {
//           _showResults = true;
//         });
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 22, 44, 23),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Padding(
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       const Icon(Icons.hourglass_empty, color: Colors.white),
//                       const SizedBox(width: 8),
//                       Text('$_counter',
//                           style: const TextStyle(color: Colors.white)),
//                     ],
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       // Handle exit action
//                     },
//                     child: IconButton(
//                       icon: const Icon(Icons.close, color: Colors.white),
//                       onPressed: () {
//                         // Handle closing action
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(1.0),
//                   child: Align(
//                     alignment: Alignment.center,
//                     child: _showResults
//                         ? const Text(
//                             'Quiz Sonucu',
//                             style: TextStyle(
//                                 color: Colors.white, fontSize: 20),
//                           )
//                         : Text(
//                             'Soru ${_currentQuestionIndex + 1}/${widget.questions.sorular!.length}',
//                             style: const TextStyle(
//                                 color: Colors.white, fontSize: 20),
//                           ),
//                   ),
//                 ),
//               ],
//             ),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: _showResults
//                     ? Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             'Doğru Cevaplar: $_correctAnswers',
//                             style: GoogleFonts.poppins(
//                               color: Colors.green,
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                           Text(
//                             'Yanlış Cevaplar: $_incorrectAnswers',
//                             style: GoogleFonts.poppins(
//                               color: Colors.red,
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                         ],
//                       )
//                     : Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             widget.questions.sorular![_currentQuestionIndex].soru!,
//                             style: GoogleFonts.poppins(
//                               color: Colors.white,
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                           const SizedBox(height: 24),
//                           AnswerButton(
//                             text:
//                                 'A) ${widget.questions.sorular![_currentQuestionIndex].secenekler![0]}',
//                             onTap: () {
//                               _handleAnswer(widget
//                                   .questions
//                                   .sorular![_currentQuestionIndex]
//                                   .secenekler![0]);
//                             },
//                             backgroundColor: Colors.white,
//                             textColor: Colors.black,
//                             isCorrect: questionAnswers[_currentQuestionIndex],
//                           ),
//                           AnswerButton(
//                             text:
//                                 'B) ${widget.questions.sorular![_currentQuestionIndex].secenekler![1]}',
//                             onTap: () {
//                               _handleAnswer(widget
//                                   .questions
//                                   .sorular![_currentQuestionIndex]
//                                   .secenekler![1]);
//                             },
//                             backgroundColor: Colors.white,
//                             textColor: Colors.black,
//                             isCorrect: questionAnswers[_currentQuestionIndex],
//                           ),
//                           AnswerButton(
//                             text:
//                                 'C) ${widget.questions.sorular![_currentQuestionIndex].secenekler![2]}',
//                             onTap: () {
//                               _handleAnswer(widget
//                                   .questions
//                                   .sorular![_currentQuestionIndex]
//                                   .secenekler![2]);
//                             },
//                             backgroundColor: Colors.white,
//                             textColor: Colors.black,
//                             isCorrect: questionAnswers[_currentQuestionIndex],
//                           ),
//                           AnswerButton(
//                             text:
//                                 'D) ${widget.questions.sorular![_currentQuestionIndex].secenekler![3]}',
//                             onTap: () {
//                               _handleAnswer(widget
//                                   .questions
//                                   .sorular![_currentQuestionIndex]
//                                   .secenekler![3]);
//                             },
//                             backgroundColor: Colors.white,
//                             textColor: Colors.black,
//                             isCorrect: questionAnswers[_currentQuestionIndex],
//                           ),
//                         ],
//                       ),
//               ),
//             ),
//             _showResults
//                 ? Container()
//                 : Container(
//                     margin: const EdgeInsets.only(bottom: 100.0),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 16.0, vertical: 8.0),
//                       child: ElevatedButton(
//                         onPressed: () {
//                           // Handle submit button action if needed
//                         },
//                         style: ElevatedButton.styleFrom(
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(5.0)),
//                           backgroundColor: Colors.black,
//                         ),
//                         child: Container(
//                           width: double.infinity,
//                           padding: const EdgeInsets.symmetric(vertical: 15.0),
//                           child: Text(
//                             'Cevapla',
//                             textAlign: TextAlign.center,
//                             style: GoogleFonts.poppins(color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class AnswerButton extends StatefulWidget {
//   final String text;
//   final VoidCallback onTap;
//   final Color backgroundColor;
//   final Color textColor;
//   final int isCorrect;

//   const AnswerButton({
//     super.key,
//     required this.text,
//     required this.onTap,
//     required this.backgroundColor,
//     required this.textColor,
//     required this.isCorrect,
//   });

//   @override
//   _AnswerButtonState createState() => _AnswerButtonState();
// }

// class _AnswerButtonState extends State<AnswerButton> {
//   Color buttonColor = Colors.white;

//   @override
//   Widget build(BuildContext context) {
//     if (widget.isCorrect == 1) {
//       buttonColor = Colors.green;
//     } else if (widget.isCorrect == 0) {
//       buttonColor = Colors.red;
//     } else {
//       buttonColor = widget.backgroundColor;
//     }

//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 500),
//         color: buttonColor,
//         child: ElevatedButton(
//           onPressed: () {
//             setState(() {
//               buttonColor = widget.isCorrect == 1 ? Colors.green : Colors.red;
//             });
//             widget.onTap();
//           },
//           style: ElevatedButton.styleFrom(
//             foregroundColor: widget.textColor,
//             backgroundColor: buttonColor,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(5.0),
//             ),
//           ),
//           child: Container(
//             width: double.infinity,
//             padding: const EdgeInsets.symmetric(vertical: 16.0),
//             child: Text(
//               widget.text,
//               textAlign: TextAlign.center,
//               style: const TextStyle(fontSize: 18),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../app/question.dart'; // Adjust import path as necessary

class QuizPage extends StatefulWidget {
  final Question questions;

  const QuizPage({Key? key, required this.questions}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _counter = 60;
  late Timer _timer;
  List<int> questionAnswers = List.filled(4, -1); // Initialize list with -1
  int _currentQuestionIndex = 0; // Track current question index
  int _correctAnswers = 0; // Track number of correct answers
  int _incorrectAnswers = 0; // Track number of incorrect answers
  bool _showResults = false; // Flag to show results

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
          // Handle timer completion if needed
          setState(() {
            _showResults = true;
          });
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _handleAnswer(String selectedAnswer, int index) {
    // Check if selected answer is correct
    bool isCorrect = selectedAnswer ==
        widget.questions.sorular![_currentQuestionIndex].cevap;

    // Update answer status for the current question
    setState(() {
      questionAnswers[index] = isCorrect ? 1 : 0;
    });

    // Update counters based on correctness
    if (isCorrect) {
      setState(() {
        _correctAnswers++;
      });
    } else {
      setState(() {
        _incorrectAnswers++;
      });
    }

    // Move to the next question or show results if all questions answered
    if (_currentQuestionIndex < widget.questions.sorular!.length - 1) {
      Timer(Duration(seconds: 2), () {
        setState(() {
          questionAnswers = List.filled(4, -1);
          _currentQuestionIndex++;
        });
      });
    } else {
      Timer(Duration(seconds: 2), () {
        setState(() {
          questionAnswers = List.filled(4, -1);
          _timer.cancel();
          _showResults = true;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 22, 44, 23),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.hourglass_empty, color: Colors.white),
                      const SizedBox(width: 8),
                      Text('$_counter', style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      // Handle closing action
                      Navigator.pop(context); // Example for closing the quiz
                    },
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
                    child: _showResults
                        ? Text(
                      'Quiz Sonucu',
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    )
                        : Text(
                      'Soru ${_currentQuestionIndex + 1}/${widget.questions.sorular!.length}',
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: _showResults
                    ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Doğru Cevaplar: $_correctAnswers',
                      style: GoogleFonts.poppins(
                        color: Colors.green,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Yanlış Cevaplar: $_incorrectAnswers',
                      style: GoogleFonts.poppins(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )
                    : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.questions.sorular![_currentQuestionIndex].soru!,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    AnswerButton(
                      text: 'A) ${widget.questions.sorular![_currentQuestionIndex].secenekler![0]}',
                      onTap: () {
                        _handleAnswer(widget.questions.sorular![_currentQuestionIndex].secenekler![0], 0);
                      },
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                      isCorrect: questionAnswers[0],
                    ),
                    AnswerButton(
                      text: 'B) ${widget.questions.sorular![_currentQuestionIndex].secenekler![1]}',
                      onTap: () {
                        _handleAnswer(widget.questions.sorular![_currentQuestionIndex].secenekler![1], 1);
                      },
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                      isCorrect: questionAnswers[1],
                    ),
                    AnswerButton(
                      text: 'C) ${widget.questions.sorular![_currentQuestionIndex].secenekler![2]}',
                      onTap: () {
                        _handleAnswer(widget.questions.sorular![_currentQuestionIndex].secenekler![2], 2);
                      },
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                      isCorrect: questionAnswers[2],
                    ),
                    AnswerButton(
                      text: 'D) ${widget.questions.sorular![_currentQuestionIndex].secenekler![3]}',
                      onTap: () {
                        _handleAnswer(widget.questions.sorular![_currentQuestionIndex].secenekler![3], 3);
                      },
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                      isCorrect: questionAnswers[3],
                    ),
                  ],
                ),
              ),
            ),
            _showResults
                ? Container()
                : Container(
              margin: const EdgeInsets.only(bottom: 100.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle submit button action if needed
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
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

class AnswerButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color textColor;
  final int isCorrect;

  AnswerButton({
    Key? key,
    required this.text,
    required this.onTap,
    required this.backgroundColor,
    required this.textColor,
    required this.isCorrect,
  }) : super(key: key);

  @override
  _AnswerButtonState createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  Color buttonColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    // Set button color based on isCorrect value
    if (widget.isCorrect == 1) {
      buttonColor = Colors.green;
    } else if (widget.isCorrect == 0) {
      buttonColor = Colors.red;
    } else {
      buttonColor = widget.backgroundColor;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {
          // Change button color on tap
          setState(() {
            buttonColor = widget.isCorrect == 1 ? Colors.green : Colors.red;
          });
          // Call onTap function
          widget.onTap();
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: widget.textColor,
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            widget.text,
            textAlign: TextAlign.center,
            style:
            TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
