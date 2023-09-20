import 'question.dart';

class Quizbrain {
  int _questionNumber = 0;
  final List<Question> _questionBank = [
    Question(
        'The total length of the Great Wall of China adds up to 13,171 miles.',
        true),
    Question('Mount Everest is the tallest mountain in the world.', true),
    Question('New York City is composed of between 36 and 42 islands.', true),
    Question('The goat is the national animal of Scotland.', false),
    Question('An octopus has seven hearts.', false),
    Question('The hummingbird egg is the world\'s smallest bird egg.', true),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    } else {}
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].q;
  }

  bool getQuestionAnswer() {
    return _questionBank[_questionNumber].b;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
