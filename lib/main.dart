import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      if (_questionIndex < 2) {
        _questionIndex++;
      } else {
        _questionIndex = 0;
      }
    });
    print('Answer Choosen: ' + _questionIndex.toString());
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'What\'s your favorite subject?', 
        'answers': ['tester', 'reader', 'writer']
      },
      {
        'questionText': 'Where do you live?', 
        'answers': ['tree', 'mountain', 'sun']
      },
      {
        'questionText': 'How are you?', 
        'answers': ['good', 'super good', 'incerdibly good']
      }
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Learner'),
        ),
        body: Column(children: [
          Question(questions[_questionIndex]['questionText']),
          ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {
            return Answer(_answerQuestion, answer);
          }).toList()
        ]),
      ),
    );
  }
}
