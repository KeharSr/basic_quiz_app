import 'package:basic_quiz_app/elevated_button.dart';
import 'package:flutter/material.dart';

import 'package:basic_quiz_app/data/quiz_data.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectedAnswers});

  final void Function(String answers) onSelectedAnswers;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var correctAnswerIndex = 0;

  void changeQuestions(String answers) {
    widget.onSelectedAnswers(answers);
    setState(() {
      correctAnswerIndex = correctAnswerIndex + 1;
    });
  }

  @override
  Widget build(context) {
    final current = quizQuestion[correctAnswerIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              current.questions,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 23,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            ...current.getShuffledAnswers().map((item) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: MyButton(item, () {
                  changeQuestions(item);
                }),
              );
            }),
          ],
        ),
      ),
    );
  }
}
