import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  StartScreen(this.startQuiz, {super.key});

  void Function() startQuiz;

  @override
  Widget build(BuildContext build) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/quiz-logo.png', width: 300),
          SizedBox(height: 30),
          Text(
            'Start Your Quiz and Learn Flutter',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          SizedBox(height: 30),
          SizedBox(
            width: 140,
            child: ElevatedButton.icon(
              onPressed: startQuiz,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purpleAccent,
              ),
              label: Text('Start'),
              icon: Icon(Icons.start, textDirection: TextDirection.ltr),
            ),
          ),
        ],
      ),
    );
  }
}
