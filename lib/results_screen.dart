import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.chosenAnswers, this.restartQuiz, {super.key});

  final List<String> chosenAnswers;
  final void Function() restartQuiz;

  List<Map<String, Object>> get summaryData {
    List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': QUESTIONS[i].text,
        'correct_answer': QUESTIONS[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  int get correctAnswers {
    return summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
  }

  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      height: 500,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctAnswers out of ${QUESTIONS.length} questions correctly',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )
            ),
            const SizedBox(height: 30),
            Expanded(
              child: SingleChildScrollView(child: QuestionSummary(summaryData)),
            ),
            const SizedBox(height: 30),
            OutlinedButton(
              onPressed: () {
                restartQuiz();
              },
              child: const Text(
                'Restart Quiz',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}