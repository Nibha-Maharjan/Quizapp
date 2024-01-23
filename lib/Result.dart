// Result.dart
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final List<String> answers;
  final VoidCallback restartHandler;

  const Result(this.questions, this.answers, this.restartHandler);

  bool areAnswersCorrect(List<String> userAnswers) {
    for (int i = 0; i < userAnswers.length; i++) {
      if (userAnswers[i] != (questions[i]['answers'] as List<String>)[2]) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    bool allCorrect = areAnswersCorrect(answers);

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: questions.length,
            itemBuilder: (context, index) {
              bool isCorrect = answers[index] ==
                  (questions[index]['answers'] as List<String>)[2];
              Color textColor = isCorrect ? Colors.blue : Colors.red;

              return SizedBox(
                height: 100,
                child: Card(
                  child: Row(
                    children: [
                      Text(
                        questions[index]['questionText'] as String,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        answers[index],
                        style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const Divider(),
        ElevatedButton(
          onPressed: restartHandler,
          child: const Text('Restart'),
        ),
        SizedBox(
          height: 20,
          child: Text(
            allCorrect
                ? 'All answers are correct!'
                : 'Some answers are incorrect.',
            style: TextStyle(
              color: allCorrect ? Colors.blue : Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
