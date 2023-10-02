import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "images/quiz-logo.png",
              width: 300,
              height: 200,
              color: const Color.fromARGB(130, 255, 255, 255),
            ),
            const SizedBox(height: 20),
            const Text(
              "Learn Flutter the fun way!",
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
            const SizedBox(height: 20),
            OutlinedButton.icon(
              onPressed: startQuiz,
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.pink,
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text("Start Quiz"),
            )
          ],
        ),
      ),
    );
  }
}
