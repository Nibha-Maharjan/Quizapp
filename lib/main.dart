import 'package:flutter/material.dart';
import 'package:quizapp/Quiz.dart';
import 'package:quizapp/Result.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});
  @override
  State<StatefulWidget> createState() {
    return MainAppState();
  }
}

class MainAppState extends State<MainApp> {
  final List<String> answers = ['', '', ''];
  var _index = 0;
  var questions = [
    {
      'questionText': 'What is your fav color',
      'answers': ['green', 'blue', 'green']
    },
    {
      'questionText': 'What is your fav dog',
      'answers': ['dog 1', 'dog 2', 'dog 3']
    },
    {
      'questionText': 'What is your fav car',
      'answers': ['car 1', 'car2', 'car 3']
    }
  ];

  void onAnswerClick() {
    setState(() {
      _index += 1;
    });
  }

  void onRestartClicked() {
    setState(() {
      _index = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Quiz App'),
          ),
          backgroundColor: Colors.indigo,
          body: _index < questions.length
              ? Center(
                  child: Quiz(questions, _index, onAnswerClick, answers),
                )
              : Center(
                  child: Result(questions, answers, onRestartClicked),
                )),
    );
  }
}
