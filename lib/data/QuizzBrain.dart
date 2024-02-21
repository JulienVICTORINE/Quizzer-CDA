import 'package:quizzer_vrs2/data/Question.dart';
import 'package:quizzer_vrs2/data/QuizzData.dart';

class QuizBrain {
  int _questionNumber = 0;
  final List<Question> _questions;
  int _score = 0; // Ajout du score

  // Constructeur pour initialiser _questions
  QuizBrain() : _questions = QuizData.quizzes[0].questions;

  String getQuestionText() {
    return _questions[_questionNumber].text;
  }

  bool getAnswer() {
    return _questions[_questionNumber].answer;
  }

  void nextQuestion() {
    if (_questionNumber < _questions.length - 1) _questionNumber++;
  }

  bool isLastQuestion() {
    return _questionNumber == _questions.length - 1;
  }

  int getScore() {
    return _score;
  }

  void updateScore(int points) {
    _score += points;
  }

  void resetScore() {
    _score = 0;
  }
}
