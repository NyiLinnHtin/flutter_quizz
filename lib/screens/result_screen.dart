import 'package:flutter/material.dart';
import 'package:flutter_quizz/blueprints/question_data.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.selectedAnswers, required this.resetScreen});

  final List<String> selectedAnswers;
  final void Function() resetScreen;

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
    final List<Map<String, Object>> summaryData = getSummaryData();
    final int correctedAnswers = summaryData.where((data) {
      return data["correct_answer"] == data["user_answer"];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ResultText(correctedAnswer: correctedAnswers),
            const SizedBox(height: 30),
            QuestionAndAnswers(summaryData: summaryData),
            const SizedBox(height: 30),
            ResetButton(resetScreen: resetScreen),
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
      textAlign: TextAlign.center,
      "You answered $correctedAnswer out of ${questions.length} questions correctly!",
      style: const TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

//QuestionAndAnswers >>> Second Component of Result Screen!
class QuestionAndAnswers extends StatelessWidget {
  const QuestionAndAnswers({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            final bool isCorrectAns =
                data["correct_answer"] == data["user_answer"];
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NumberText(
                  qNumber: data["question_index"] as int,
                  qTrue: isCorrectAns,
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data["question"] as String,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      !isCorrectAns
                          ? Text(
                              "Corrected Answer : ${data["correct_answer"].toString()}",
                              style: const TextStyle(
                                  color: Colors.lightGreenAccent),
                            )
                          : const SizedBox(),
                      const SizedBox(height: 2),
                      Text("Your Answer : ${data["user_answer"].toString()}"),
                      const SizedBox(height: 15),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

class NumberText extends StatelessWidget {
  const NumberText({super.key, required this.qNumber, required this.qTrue});

  final int qNumber;
  final bool qTrue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: qTrue ? Colors.greenAccent : Colors.redAccent,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        (qNumber + 1).toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}

//ResetButton >>> Third Component of Result Screen!
class ResetButton extends StatelessWidget {
  const ResetButton({super.key, required this.resetScreen});

  final void Function() resetScreen;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: resetScreen,
      style: TextButton.styleFrom(
        backgroundColor: Colors.lightGreen,
      ),
      icon: const Icon(Icons.replay_rounded),
      label: const Text("Reset!"),
    );
  }
}
