import 'package:flutter/material.dart';
import 'package:matematica_app/quiz.dart';
import 'package:matematica_app/result.dart';

void main() => runApp(const AskApp());

class AskApp extends StatefulWidget {
  const AskApp({super.key});
  // ????????????????????????????? what is super.key??

  @override
  AskAppState createState() {
    return AskAppState();
  }
}

class AskAppState extends State<AskApp> {
  var _selectedQuestion = 0;
  var _totalValue = 0;
  final _asks = const [
    {
      'text': "What is the answer to 11+10 = ?",
      'answers': [
        {'text': '82', 'punctuation': 0},
        {'text': '21', 'punctuation': 10},
        {'text': '20', 'punctuation': 5},
        {'text': '24', 'punctuation': 4},
      ],
    },
    {
      'text': "What is the answer to 11x10= ?",
      'answers': [
        {'text': '110', 'punctuation': 10},
        {'text': '1010', 'punctuation': 0},
        {'text': '100', 'punctuation': 4},
        {'text': '101', 'punctuation': 5},
      ],
    },
    {
      'text': "What is the answer to 11/10= ?",
      'answers': [
        {'text': '1,0', 'punctuation': 5},
        {'text': '0', 'punctuation': 0},
        {'text': '1,1', 'punctuation': 10},
        {'text': '1,2', 'punctuation': 4},
      ],
    },
    {
      'text': "What is the answer to 2.841.985 + 871.999= ?",
      'answers': [
        {'text': '3.137.894', 'punctuation': 5},
        {'text': '3.984.713', 'punctuation': 4},
        {'text': '4.985.780', 'punctuation': 0},
        {'text': '3.713.984', 'punctuation': 10},
      ],
    },
    {
      'text': "What is the answer to 2.841.985 - 871.999= ?",
      'answers': [
        {'text': '1.969.986', 'punctuation': 10},
        {'text': '2.869.968', 'punctuation': 5},
        {'text': '10.969.986', 'punctuation': 0},
        {'text': '1.698.896', 'punctuation': 4},
      ],
    },
    {
      'text': "What is the answer to 0.08x28 ?",
      'answers': [
        {'text': '12', 'punctuation': 0},
        {'text': '1,2', 'punctuation': 4},
        {'text': '2,2', 'punctuation': 5},
        {'text': '2,24', 'punctuation': 10},
      ],
    },
  ];

  void _toRespond(int punctuation) {
    //quando houver a resposta, entao esse metodo ira substituir o valor para da pontuacao para
    // haver a verficacao correta dos pontos corretos de cada pergunta
    if (haveSelectedAsk) {
      setState(() {
        _selectedQuestion++;
        _totalValue += punctuation;
      });
    }
  }

  void _restartQuestions() {
    //ao finalizar o questionario, os valores das variaveis serao resetados
    setState(() {
      _selectedQuestion = 0;
      _totalValue = 0;
    });
  }

  bool get haveSelectedAsk {
// vai checar. o map tem uma posicao na variavel, entao se o tamanho da lista gerada for zero, significa q esta na primeira pergunta
//logo, nao foi selecionado. entao pega-se o tamanho da lista e compara com o valor da variavel selectedQuestion que eh zero
// se o tamanho da lista gerada for maior q zero eh pq a variavel foi selecionada.

    return _selectedQuestion < _asks.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ask about Math'),
        ),
        body: haveSelectedAsk
            ? Quiz(
                asks: _asks,
                selectedQuestion: _selectedQuestion,
                toRespond: _toRespond,
              )
            : Result(
                _totalValue,
                _restartQuestions,
              ),
      ),
    );
  }
}
