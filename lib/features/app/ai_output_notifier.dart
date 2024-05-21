import 'package:flutter/material.dart';

class AiOutputNotifier extends ChangeNotifier {
  String _aiOutput = "";

  String get aiOutput => _aiOutput;

  void updateAiOutput(String newOutput) {
    _aiOutput = newOutput;
    notifyListeners(); // Değişiklikleri dinleyicilere bildir
  }

   void clearAiOutput() {
    _aiOutput = "";
    notifyListeners();
  }
}