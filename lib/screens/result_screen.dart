import 'package:flutter/material.dart';
import 'package:flutter_quizz/blueprints/question_data.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.selectedAnswers});

  final List<String> selectedAnswers;
  final int correctAnswer = 0;

  int getCorrectedAnswers() {
    int correctedAnswers = 0;

    for (int i = 0; i < selectedAnswers.length; i++) {
      if (selectedAnswers[i] == questions[i].answers[0]) {
        correctedAnswers++;
      }
    }
    return correctedAnswers;
  }

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summaryData = [];

    for (int i = 0; i < selectedAnswers.length; i++) {
      summaryData.add({
        "question_index": i,
        "question": questions[i].question,
        "correct_answer": questions[i].answers[0],
        "user_answer": selectedAnswers[i]
      });
    }

    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ResultText(correctedAnswer: getCorrectedAnswers()),
            const SizedBox(height: 30),
            QuestionAndAnswers(summaryData: getSummaryData()),
            const SizedBox(height: 30),
            const ResetButton(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

//ResultText >>> First Component of Result Screen!
class ResultText extends StatelessWidget {
  const ResultText({super.key, required this.correctedAnswer});

  final int correctedAnswer;
  @override
  Widget build(BuildContext context) {
    return Text(
        "You answered $correctedAnswer out of ${questions.length} questions correctly!");
  }
}

//QuestionAndAnswers >>> Second Component of Result Screen!
class QuestionAndAnswers extends StatelessWidget {
  const QuestionAndAnswers({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: summaryData.map((data) {
        return Row(
          children: [
            Text(((data["question_index"] as int) + 1).toString()),
            Expanded(
              child: Column(
                children: [
                  Text(data["question"] as String),
                  const SizedBox(height: 5),
                  Text(data["correct_answer"] as String),
                  const SizedBox(height: 5),
                  Text(data["user_answer"] as String),
                ],
              ),
            )
          ],
        );
      }).toList(),
    );
  }
}

//ResetButton >>> Third Component of Result Screen!
class ResetButton extends StatelessWidget {
  const ResetButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: const Text("Reset!"),
    );
  }
}
