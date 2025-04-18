// 
// quiz_screen.dart
// 
// This is the screen where
// the user will be prompted
// with a question and multiple
// choice options.
//

import '../assets/essential.dart';

// QuizScreen class
class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700], // Blue background
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Progress bar and score
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Question 8 of 30',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      ProgressBar(
                        currentQuestion: 8,
                        totalQuestions: 30,
                      ),
                    ],
                  ),
                  Text(
                    '946',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              // Question text
              Center(
                child: Text(
                  'What does the formula\nF=MA mean?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 40),
              // Answer options
              Expanded(
                child: ListView(
                  children: [
                    AnswerButton(text: "Newton's First Law"),
                    AnswerButton(text: "Force is Mass plus Acceleration"),
                    AnswerButton(text: "Mass times acceleration is Force"),
                    AnswerButton(text: "Leibnitz's second Law"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnswerButton extends StatelessWidget {
  final String text;

  AnswerButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[300], // Button background color
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

class ProgressBar extends StatelessWidget {
  final int currentQuestion;
  final int totalQuestions;

  ProgressBar({
    required this.currentQuestion, 
    required this.totalQuestions
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: LinearProgressIndicator(
        value: currentQuestion / totalQuestions,
        backgroundColor: Colors.grey[800],
        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
        minHeight: 8,
      ),
    );
  }
}