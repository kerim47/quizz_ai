import 'package:example_for_oua_ai/guiz_page.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:example_for_oua_ai/landing_page.dart';

class AI {
  String _input = "";

  set input(String value) {
    _input = value;
  }

  Future<void> main() async {
    // Access your API key as an environment variable (see "Set up your API key" above)
    const apiKey = '';
    // For text-only input, use the gemini-pro model
    final model = GenerativeModel(
        model: 'gemini-pro',
        apiKey: apiKey,
        generationConfig: GenerationConfig(maxOutputTokens: 200));
    // Initialize the chat
    final chat = model.startChat(history: [
      Content.text(
          ''), //Burada ön tanımlama yapılabilir.
      Content.model([TextPart('Merhaba. Ben senin soru botunum')])
    ]);
    var content = Content.text(_input);
    var response = await chat.sendMessage(content);
    QuizPage().input = response as String;
  }
}
