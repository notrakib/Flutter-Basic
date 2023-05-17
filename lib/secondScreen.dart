import 'package:flutter/material.dart';
import './data/questions.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen(
      {super.key,
      this.changeScreen,
      required this.handleAnswer,
      required this.changeQues,
      required this.currentQues});

  final void Function()? changeScreen;
  final void Function(String ans) handleAnswer;
  final void Function() changeQues;
  final int currentQues;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  void changeQues(String ans) {
    widget.handleAnswer(ans);
    widget.changeQues();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(questions[widget.currentQues].question),
        ...questions[widget.currentQues].getShuffledAnswers().map((each) {
          return ElevatedButton(
              onPressed: () {
                changeQues(each);
              },
              child: Text(each));
        })
      ],
    );
  }
}
