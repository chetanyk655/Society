import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  StartScreen(this.switchScreen, {super.key});
  void Function() switchScreen;
  @override
  Widget build(context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/quiz-logo.png',
          width: 300,
          color: const Color.fromARGB(201, 243, 241, 241),
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          "Learn Flutter in fun way",
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w800),
        ),
        const SizedBox(
          height: 30,
        ),
        OutlinedButton.icon(
            onPressed: switchScreen,
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll<Color>(Colors.deepOrange),
            ),
            icon: const Icon(
              Icons.arrow_right_alt,
              weight: 500,
              size: 32,
            ),
            label: const Text(
              "Start Quiz",
              style: TextStyle(fontSize: 50, color: Colors.white),
            ))
      ],
    ));
  }
}
