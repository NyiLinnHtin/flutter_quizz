import 'package:flutter/material.dart';
import 'start_screen.dart';
import 'questions.dart';
import 'package:flutter_quizz/blueprints/question_data.dart';
import 'result_screen.dart';

class Quizz extends StatefulWidget {
  const Quizz({super.key});

  @override
  State<Quizz> createState() => _QuizzState();
}

class _QuizzState extends State<Quizz> {
  String activeScreen = "start-screen";
  List<String> selectedAns = [];

  void chooseAns(String answer) {
    selectedAns.add(answer);

    if (selectedAns.length == questions.length) {
      setState(() {
        activeScreen = "result-screen";
      });
    }
  }

  void changeScreen() {
    setState(() {
      activeScreen = "questions-screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreenWidget = StartScreen(changeScreen);
    // StartScreen(changeScreen)
    // : QuestionScreen(onSelectAns: chooseAns);
    if (activeScreen == "questions-screen") {
      activeScreenWidget = QuestionScreen(onSelectAns: chooseAns);
    } else if (activeScreen == "result-screen") {
      activeScreenWidget = ResultScreen(
        selectedAnswers: selectedAns,
      );
    }

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.cyan, Colors.blue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
      ),
      child: activeScreenWidget,
    );
  }
}
