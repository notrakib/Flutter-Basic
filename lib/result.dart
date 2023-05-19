import 'package:flutter/material.dart';
import 'data/questions.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen(this.answerList, {super.key});

  final List<String> answerList;
  final List<Map<String, Object>> summaryList = [];

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  List<Map<String, Object>> resultList() {
    for (var i = 0; i < questions.length; i++) {
      widget.summaryList.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': widget.answerList[i]
      });
    }

    return widget.summaryList;
  }

  @override
  void initState() {
    resultList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final int number = widget.summaryList.where((element) {
      if (element["correct_answer"] == element["user_answer"]) {
        return true;
      } else {
        return false;
      }
    }).length;

    final int numOfQues = widget.summaryList.length;

    return Column(
      children: [
        Text("$number answers are correct out of $numOfQues"),
        SizedBox(
          height: 500,
          child: ListView(
              children: widget.summaryList.map((data) {
            return Column(
              children: [
                Text(((data['question_index'] as int) + 1).toString(),
                    style: const TextStyle(fontSize: 10)),
                Text(data['question'].toString(),
                    style: const TextStyle(fontSize: 10)),
                Text(data['correct_answer'].toString(),
                    style: const TextStyle(fontSize: 10)),
                Text(data['user_answer'].toString(),
                    style: const TextStyle(fontSize: 10)),
              ],
            );
          }).toList()),
        ),
      ],
    );
  }
}
