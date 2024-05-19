import 'package:flutter/material.dart';

class Welcome2 extends StatefulWidget {
  const Welcome2({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Welcome2State createState() => _Welcome2State();
}

class _Welcome2State extends State<Welcome2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'quizz.ai',
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            const SizedBox(height: 20),
            const Text(
              'Yapay zekanın quiz dünyası',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text('Evet, kesinlikle çıkalım!'),
            ),
          ],
        ),
      ),
    );
  }
}
