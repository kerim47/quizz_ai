import 'dart:convert';
import 'package:http/http.dart' as http;

// class GeminiGenius {
//   static Future<String?> chatTextGenerationRepo(
//       List<ChatMessageModel> previousMessages) async {
//     try {
//       Dio dio = Dio();
//       final response = await dio.post(
//           // Added await before dio.post
//           "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.0-pro-001:generateContent?key=${gemini_api_key}",
//           data: {
//             "contents": previousMessages.map((e) => e.toMap()).toList(),
//             "generationConfig": {
//               "temperature": 0.9,
//               "topK": 1,
//               "topP": 1,
//               "maxOutputTokens": 2048,
//               "stopSequences": []
//             },
//             "safetySettings": [
//               {
//                 "category": "HARM_CATEGORY_HARASSMENT",
//                 "threshold": "BLOCK_MEDIUM_AND_ABOVE"
//               },
//               {
//                 "category": "HARM_CATEGORY_HATE_SPEECH",
//                 "threshold": "BLOCK_MEDIUM_AND_ABOVE"
//               },
//               {
//                 "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
//                 "threshold": "BLOCK_MEDIUM_AND_ABOVE"
//               },
//               {
//                 "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
//                 "threshold": "BLOCK_MEDIUM_AND_ABOVE"
//               }
//             ]
//           });
//       if (response.statusCode! >= 200 && response.statusCode! < 300) {
//         return response.data['candidates'].first['content']['parts']
//             .first['text'] as String?;
//       }
//     } catch (e) {
//       log(e.toString());
//     }
//     return null;
//   }
// }

// class ChatMessageModel {
//   final String text;
//   final String role;

//   ChatMessageModel({required this.text, required this.role});

//   Map<String, dynamic> toMap() {
//     return {
//       'text': text,
//       'role': role,
//     };
//   }
// }

Future<String> sendMessage(String message) async {
  const apiKey = 'AIzaSyCE1wsccx5LDAHruzyzEluiI3pphbAk6a8';

  final url = Uri.parse('https://api.google.dev/gemini-api/v1/generate');

  try {
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'model': 'gemini-1.5-flash-latest',
        'generationConfig': {
          'temperature': 1.0,
          'topK': 64,
          'topP': 0.95,
          'maxOutputTokens': 8192,
          'responseMimeType': 'text/plain',
        },
        'safetySettings': [
          {'category': 'HARASSMENT', 'threshold': 'MEDIUM_AND_ABOVE'},
          {'category': 'HATE_SPEECH', 'threshold': 'MEDIUM_AND_ABOVE'},
          {'category': 'SEXUALLY_EXPLICIT', 'threshold': 'MEDIUM_AND_ABOVE'},
          {'category': 'DANGEROUS_CONTENT', 'threshold': 'MEDIUM_AND_ABOVE'},
        ],
        'systemInstruction': {
          'text':
              "You are a AI for a quiz app. Users will give a subject and you will create questions about that subject.\n\nFirst, greet the user briefly, introduce yourself and tell them to write a topic to ask a question about.\n\nUse emojis, one per sentence.\n\nSet the question length to a maximum of 5 paragraphs.\n\nUse Turkish language.\n\nOnce the questions are answered, ask the user if they would like to change the subject.\n\nGive the user 4 question options.\n\nAfter the user answers, use sentences explaining the correct answer. Give these descriptive sentences in a separate paragraph and in an orderly manner. Use emoji per sentence in your explanation sentences.\n\nGive only 1 question.\n\nDon't give the true answer in questions phase."
        },
        'messages': [
          {'role': 'user', 'content': message}
        ],
      }),
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return jsonResponse['candidates']
          .first['content']['parts']
          .first['text']
          .toString();
    } else {
      return 'Error: ${response.reasonPhrase}';
    }
  } catch (e) {
    return 'Error: $e';
  }
}
