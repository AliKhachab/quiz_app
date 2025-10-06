import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/one-piece-logo.png', 
          width: 300,
          ),
        const SizedBox(height: 80),
        Center(
          child: const Text(
            'How much do you know about OP?',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        const SizedBox(height: 30),
        OutlinedButton.icon(
          icon: const Icon(Icons.arrow_right_alt),
          onPressed: startQuiz,
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
          ),
          label: Text('Start Quiz'),
        ),
      ],
    );
  }
}
