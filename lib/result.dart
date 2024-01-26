import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int punctuation;
  final void Function() toRestartQuiz;

  const Result(this.punctuation, this.toRestartQuiz, {super.key});

  String get phraseResult {
    if (punctuation == 60) {
      return 'Excellent! You got them all right! :D';
    } else if (punctuation >= 30 && punctuation < 60) {
      return 'Good! Almost there, ok? You can improve something ;)';
    } else if (punctuation <= 24 && punctuation >= 1) {
      return 'Ok. Not your best. :o';
    } else {
      return 'Horrible. You need to study Math now! Then You come back here. D:';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            phraseResult,
            style: const TextStyle(
              fontSize: 28,
            ),
          ),
        ),
        TextButton(
          onPressed: toRestartQuiz,
          child: const Text(
            'Reiniciar?',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
