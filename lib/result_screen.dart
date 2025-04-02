import 'package:basic_quiz_app/summary_data.dart';
import 'package:flutter/material.dart';
import 'package:basic_quiz_app/data/quiz_data.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    keh,
    required this.chosenAnswer,
    required this.onRestartPressed,
  }) : super(key: keh);

  final List<String> chosenAnswer;

  final VoidCallback onRestartPressed;

  List<Map<String, Object>> summaryData() {
    final List<Map<String, Object>> summaryAnswers = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summaryAnswers.add({
        'questions_index': i,
        'questions': quizQuestion[i].questions,
        'correct_answers': quizQuestion[i].answers[0],
        'user_answers': chosenAnswer[i],
      });
    }
    return summaryAnswers;
  }

  @override
  Widget build(context) {
    final summary = summaryData();
    final totalQuestions = quizQuestion.length;
    final correctQuestion =
        summary.where((item) {
          return item['user_answers'] == item['correct_answers'];
        }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctQuestion out of $totalQuestions questions correctly!',
              style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 221, 195, 195),
                fontSize: 19,
              ),
            ),
            SizedBox(height: 30),
            SummaryData(summaryData()),
            SizedBox(height: 30),
            TextButton.icon(
              icon: Icon(
                Icons.restart_alt,
                color: Colors.white,
                weight: 2,
                size: 25,
              ),
              onPressed: onRestartPressed,
              label: Text(
                'Restart Quiz!',

                style: GoogleFonts.poppins(color: Colors.white, fontSize: 21),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
