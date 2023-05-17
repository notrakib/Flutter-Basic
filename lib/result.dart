import 'package:flutter/material.dart';
import './model/questionAnswer.dart';
import './data/questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.answerList, {super.key});

  final List<String> answerList;

  List<Map<String, Object>> resultList() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < questions.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': answerList[i]
      });
    }

    print(answerList);

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(scrollDirection: Axis.vertical, children: [
      ElevatedButton(onPressed: resultList, child: const Text("result"))
    ]);
  }
}
