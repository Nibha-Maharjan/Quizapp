import 'package:flutter/material.dart';

import 'Answer.dart';
import 'Question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int index;
  const Quiz(this.questions, this.index);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[index]['questionText'] as String),
        Answer((questions[index]['answers'] as List<String>)[0]),
        Answer((questions[index]['answers'] as List<String>)[1]),
        Answer((questions[index]['answers'] as List<String>)[2]),
      ],
    );
  }
}
