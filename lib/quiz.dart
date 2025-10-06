import 'package:flutter/material.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key}); // positional parameter, requires this.startQuiz when creating Quiz instance

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  List<String> selectedAnswers = [];

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == QUESTIONS.length) {
      setState(() {
        // selectedAnswers = []; // reset for a new quiz call @ results screen once page is loaded
        activeScreen = ResultsScreen(selectedAnswers, restartQuiz);
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionScreen(onSelectedAnswer: chooseAnswer);
    });
  }
  

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = StartScreen(switchScreen);
    });
  }

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(child: activeScreen),
        ),
      ),
    );
  }
}
