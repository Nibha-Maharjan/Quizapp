import 'package:flutter/material.dart';
import 'package:quizapp/Quiz.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
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
                  child: Quiz(questions, _index),
                )
              : const Center(
                  child: Text('All Done'),
                )),
    );
  }
}
