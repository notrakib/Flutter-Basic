import 'package:flutter/material.dart';
import './firstScreen.dart';
import './secondScreen.dart';
import './result.dart';
import './data/questions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var currentScreen = "first-screen";
  var answerList = [];
  var currentQues = 0;

  void changeQues() {
    setState(() {
      if (currentQues < questions.length - 1) {
        currentQues++;
      }
      if (currentQues == questions.length - 1) {
        currentScreen = "result-screen";
      } else {
        return;
      }
    });
  }

  void handleAnswer(String ans) {
    answerList.add(ans);
    print(answerList);
  }

  void changeScreen() {
    setState(() {
      currentScreen = "second-screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: currentScreen == 'first-screen'
          ? FirstScreen(changeScreen)
          : currentScreen == 'second-screen'
              ? SecondScreen(
                  handleAnswer: handleAnswer,
                  changeQues: changeQues,
                  currentQues: currentQues)
              : const ResultScreen(),
    );
  }
}
