import 'package:flutter/material.dart';
import 'quiz_brain.dart';

Quizbrain quizbrain = Quizbrain();
void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int questionNumber = 0;

  List<Icon> scoreKeeper = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizbrain.questionBank[questionNumber].q,
                style: const TextStyle(color: Colors.white, fontSize: 25.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                bool correctAnswer = quizbrain.questionBank[questionNumber].b;
                if (correctAnswer == true) {
                  setState(() {
                    scoreKeeper
                        .add(const Icon(Icons.check, color: Colors.green));
                  });
                } else {
                  setState(() {
                    scoreKeeper.add(const Icon(
                      Icons.close,
                      color: Colors.red,
                    ));
                  });
                }
                setState(() {
                  questionNumber++;
                });
              },
              child: const Text(
                'True',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                bool correctAnswer = quizbrain.questionBank[questionNumber].b;
                if (correctAnswer == false) {
                  setState(() {
                    scoreKeeper
                        .add(const Icon(Icons.check, color: Colors.green));
                  });
                } else {
                  setState(() {
                    scoreKeeper.add(const Icon(Icons.close, color: Colors.red));
                  });
                }
                setState(() {
                  questionNumber++;
                });
              },
              child: const Text(
                'False',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
