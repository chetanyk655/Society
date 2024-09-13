import 'package:first_app/chetan/question_screen.dart';
import 'package:flutter/material.dart';
import 'package:first_app/chetan/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = StartScreen(changeScreen);
    super.initState();
  }

  void changeScreen() {
    setState(() {
      activeScreen = const QuestionScreen();
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [Colors.blue, Colors.deepPurpleAccent],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: activeScreen,
    )));
  }
}
