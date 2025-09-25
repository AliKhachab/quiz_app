import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
    {
      super.key,
      required this.answerText,
      required this.onTap,
    });
    // named parameters, which are optional by default, but required keyword makes them mandatory.
    // made them named so it looks better in the question_screen.dart file.

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 40,
        ),
        backgroundColor: const Color.fromARGB(255, 3, 1, 95),
        foregroundColor: Colors.white,
      ),
      child: Text(answerText),
    );
  }
}