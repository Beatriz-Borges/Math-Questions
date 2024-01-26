import 'package:flutter/material.dart';
import 'package:matematica_app/answer.dart';
import 'package:matematica_app/question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> asks;
  final int selectedQuestion;
  final void Function(int) toRespond;

  const Quiz({
    required this.asks,
    required this.selectedQuestion,
    required this.toRespond,
    super.key,
  });

  bool get haveSelectedQuestion {
    return selectedQuestion < asks.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers = haveSelectedQuestion ? asks[selectedQuestion]['answers'] as List<Map<String, Object>> : [];
    //lista de respostas. entao se tiver uma pergunta selecionada, entao pega o valor do map da pergunta selecionada e verifica a resposta e converte numa listaa
    //se nao tem pergunta selecionada entao nao tera resposta selecionada
    return Column(
      children: [
        Question(asks[selectedQuestion]['text'] as String),
        ...answers.map((resp) {
          return Answer(
            resp['text'] as String,
            () => toRespond(resp['punctuation'] as int),
          );
        }).toList(),
      ],
    );
  }
}
