import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quizzer_vrs2/data/Quizz.dart';
import 'package:quizzer_vrs2/data/QuizzBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizPage extends StatefulWidget {
  final Quiz quiz;

  QuizPage({required this.quiz});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuizBrain quizBrain = QuizBrain();
  List<Icon> scoreKeeper = [];
  late Timer _timer;
  int _timeLeft = 5; // 5 secondes par question
  bool _quizCompleted = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

   @override
  void dispose() {
    _timer.cancel(); // Annuler la minuterie pour éviter les fuites de mémoire
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeLeft > 0) {
          _timeLeft--;
        } else {
          _timeLeft = 5; // Réinitialiser le temps pour la question suivante
          _handleTimeoutNoAnswer();
        }
      });
    });
  }

  void _handleTimeoutNoAnswer() {
    setState(() {
      // Vérifier si le quiz est déjà terminé
      if (_quizCompleted) {
        return;
      }

      // Ajouter une icône close pour indiquer que l'utilisateur n'a pas répondu
      scoreKeeper.add(Icon(Icons.close, color: Colors.red));

      if (quizBrain.isLastQuestion()) {
        // Afficher une alerte pour indiquer que le quiz est terminé
        showResultAlert();

        // Marquer le quiz comme terminé
        _quizCompleted = true;
      } else {
        _timeLeft = 5; // Réinitialiser le temps pour la nouvelle question
        _timer.cancel(); // Arrêter le chronomètre actuel
        _startTimer(); // Redémarrer le chronomètre pour la nouvelle question
        quizBrain.nextQuestion();
      }
    });
  }

  void _handleTimeout() {
    // Logique pour passer à la question suivante en cas de timeout
    _timer.cancel(); // Arrêter le chronomètre
    quizBrain.nextQuestion();
    _startTimer(); // Redémarrer le chronomètre pour la nouvelle question
  }

  void checkAnswer(bool userAnswer) {
    bool correctAnswer = quizBrain.getAnswer();

    setState(() {
      if (_timer.isActive) {
        // L'utilisateur a répondu dans le délai
        if (userAnswer == correctAnswer) {
          scoreKeeper.add(Icon(Icons.check, color: Colors.green));
          quizBrain.updateScore(1); // Augmente le score si la réponse est correcte
        } else {
          scoreKeeper.add(Icon(Icons.close, color: Colors.red));
        }
      } else {
        // Le temps s'est écoulé, mais l'utilisateur n'a pas répondu
        _handleTimeoutNoAnswer();
        return;
      }

      if (quizBrain.isLastQuestion()) {
        // Afficher une alerte pour indiquer que le quiz est terminé
        showResultAlert();
      } else {
        quizBrain.nextQuestion();
      }
    });
  }

  void showResultAlert() {
    Alert(
      context: context,
      title: "Quiz Terminé",
      desc: "Vous avez terminé le quiz ! Votre score final est ${quizBrain.getScore()}",
      buttons: [
        DialogButton(
          child: Text(
            "Recommencer",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pop(context);
            resetQuiz();
          },
          width: 120,
        ),
        DialogButton(
          child: Text(
            "Retour à la page d'accueil",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context); // Pour revenir à la page d'accueil
          },
          width: 120,
        ),
      ],
    ).show();
  }

  void resetQuiz() {
    setState(() {
      scoreKeeper.clear();
      quizBrain.resetScore(); // Réinitialiser le score
      _quizCompleted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 5,
                child: Center(
                  child: Text(
                    quizBrain.getQuestionText(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    onPressed: () {
                      checkAnswer(true);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    child: Text(
                      "Vrai",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    onPressed: () {
                      checkAnswer(false);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    child: Text(
                      "Faux",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ),
              Row(
                children: scoreKeeper,
              ),
            ],
          ),
        ),
      ),
    );
  }
}