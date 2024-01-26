import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String text;
  final void Function() toRespond;

  const Answer(this.text, this.toRespond, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        onPressed: toRespond,
        child: Text(text),
      ),
    );
  }
}
