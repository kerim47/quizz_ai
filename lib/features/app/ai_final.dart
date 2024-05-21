// ignore_for_file: prefer_const_constructors

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:provider/provider.dart';
import 'package:quizz_ai/features/app/ai_output_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

import '../user_auth/presentation/pages/quiz_final_page.dart';


class AIPageFinal extends StatefulWidget {
  final String initialMessage;

  const AIPageFinal({super.key, required this.initialMessage});

  @override
  State<AIPageFinal> createState() => _AIPageFinalState();
}

class _AIPageFinalState extends State<AIPageFinal> {
  final AiOutputNotifier aiOutputNotifier = AiOutputNotifier();
  final Gemini gemini = Gemini.instance;

  List<ChatMessage> messages = [];

  ChatUser currentUser = ChatUser(id: "0", firstName: "User");
  ChatUser geminiUser = ChatUser(
    id: "1",
    firstName: "Gemini",
    profileImage:
        "https://seeklogo.com/images/G/google-gemini-logo-A5787B2669-seeklogo.com.png",
  );

  @override
  void initState() {
    super.initState();
    if (widget.initialMessage.isNotEmpty) {
      _sendMessage(ChatMessage(
        user: currentUser,
        createdAt: DateTime.now(),
        text: widget.initialMessage,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Quizz AI",
        ),
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return DashChat(
      currentUser: currentUser,
      onSend: _sendMessage,
      messages: messages,
    );
  }

  void _sendMessage(ChatMessage chatMessage) {
    setState(() {
      messages = [chatMessage, ...messages];
    });

    final aiOutputNotifier = Provider.of<AiOutputNotifier>(context, listen: false);
        
    try {
      String question = chatMessage.text;
      gemini
          .streamGenerateContent(
        question,
      )
          .listen((event) {
        ChatMessage? lastMessage = messages.firstOrNull;
        if (lastMessage != null && lastMessage.user == geminiUser) {

          lastMessage = messages.removeAt(0);

          String response = event.content?.parts?.fold(
                  "", (previous, current) => "$previous ${current.text}") ??
              "";

          lastMessage.text += response;

          setState(
            () {
              messages = [lastMessage!, ...messages];
            },
          );

        } else {

          String response = event.content?.parts?.fold(
                  "", (previous, current) => "$previous ${current.text}") ??
              "";

          
          ChatMessage message = ChatMessage(
            user: geminiUser,
            createdAt: DateTime.now(),
            text: response,
          );

          aiOutputNotifier.updateAiOutput(message.text); //3.Kısım
          setState(() {
            messages = [message, ...messages];
          });


          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => QuizResultPage(),
            ),
          );
        }
      });
    } catch (e) {
      print(e);
    }
  }
}