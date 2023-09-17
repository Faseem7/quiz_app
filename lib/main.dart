import 'package:flutter/material.dart';

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
  List<String> questions = [
    'The total length of the Great Wall of China adds up to 13,171 miles.', //true
    'Mount Everest is the tallest mountain in the world.', //true
    'New York City is composed of between 36 and 42 islands.', //true
    'The goat is the national animal of Scotland.', //false
    'An octopus has seven hearts.', //false
    'The hummingbird egg is the world\'s smallest bird egg.', //true,
    'congrats',
    'nothing'
  ];

  List<bool> answers = [true, true, true, false, false, true,true,true,true];

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
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[questionNumber],
                style: TextStyle(color: Colors.white, fontSize: 25.0),
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
                bool correctAnswer = answers[questionNumber];
                if (correctAnswer == true) {
                  setState(() {
                    scoreKeeper.add(Icon(Icons.check,
                    color:Colors.green));
                  });
                }else{
                  setState(() {
                    scoreKeeper.add(Icon(Icons.close,
                    color: Colors.red,));
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
                 bool correctAnswer = answers[questionNumber];
                if (correctAnswer == false) {
                  setState(() {
                    scoreKeeper.add(Icon(Icons.check,
                    color:Colors.green));
                  });
                } else {
                  setState(() {
                    scoreKeeper.add(Icon(Icons.close,
                    color:Colors.red));
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
