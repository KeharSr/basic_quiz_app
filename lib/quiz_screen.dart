import 'package:basic_quiz_app/data/quiz_data.dart';
import 'package:basic_quiz_app/questions_screen.dart';
import 'package:basic_quiz_app/result_screen.dart';
import 'package:basic_quiz_app/start_screen.dart';
import 'package:flutter/material.dart';

// Widget? changeScreen;

// @override
// void initState() {
//   changeScreen = StartScreen(changedScreen);
//   super.initState();
// }

// Another Method We have here instead of init state

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];

  var activeScreen = 'start-screen';

  void changedScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void storeAnswers(String answers) {
    selectedAnswers.add(answers);
    print(answers);
    if (selectedAnswers.length == quizQuestion.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void onRestartPressed() {
    setState(() {
      activeScreen = 'question-screen';
      selectedAnswers = [];
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(changedScreen);

    if (activeScreen == 'question-screen') {
      screenWidget = QuestionsScreen(onSelectedAnswers: storeAnswers);
    }

    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        chosenAnswer: selectedAnswers,
        onRestartPressed: onRestartPressed,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 58, 1, 93),
                const Color.fromARGB(255, 145, 62, 229),
                const Color.fromARGB(255, 49, 34, 63),
              ],
              begin: Alignment.bottomRight,
              end: Alignment.bottomLeft,
            ),
          ),

          child: activeScreen == 'start-screen' ? screenWidget : screenWidget,
        ),
      ),
    );
  }
}
