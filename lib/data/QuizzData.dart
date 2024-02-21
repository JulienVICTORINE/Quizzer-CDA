import 'package:quizzer_vrs2/data/Question.dart';
import 'package:quizzer_vrs2/data/Quizz.dart';

class QuizData {
  static List<Quiz> quizzes = [
    Quiz(title: 'Football', questions: [
    Question(text: 'Le recours à l\'assistance vidéo en arbitrage est aujourd\'hui autorisé au football.', answer: true),
      Question(text: 'L\'équipement complet d\'un arbitre de foot se compose d\'un sifflet, un carton jaune et un carton rouge.', answer: false),
      Question(
          text: 'Pour être homologué dans les compétitions officielles, le ballon de foot doit être noir et blanc.',
          answer: false),
      Question(text: 'Le gardien de but est le seul joueur à pouvoir toucher le ballon avec la main sur l\'ensemble du terrain.', answer: false),
      Question(
          text: 'Un but est accordé dès lors que le ballon touche la ligne de but.',
          answer: false),
      Question(
          text: 'Un joueur est en position de hors-jeu s\'il se trouve plus près de la ligne de but adverse que le ballon et l\'avant-dernier adversaire.',
          answer: true),
    ]),

    Quiz(title: 'Culture Générale', questions: [
      Question(text: 'Tokyo est la capitale du Japon.', answer: true),
      Question(
          text: 'Un colibri d\'Elena pèse aussi lourd qu\'une pièce d\'un euro.',
          answer: false),
      Question(text: 'Le requin est l\'animal le plus dangereux pour l\'homme.', answer: false),
      Question(text: 'Le café est originaire d\'Amérique.', answer: false),
      Question(text: 'Le Mont Fuji au Japon est un volcan.',
          answer: true),
      Question(text: 'Les huîtres peuvent changer de sexe au moment de l\'accouplement.',
          answer: true), 
    ]),

    Quiz(title: 'Harry Potter', questions: [
      Question(text: 'Le tome 1 se nomme "Harry Potter à l\'école des sorciers".', answer: true),
      Question(text: 'Harry est envoyé dans la maison Serpentard.', answer: false),
      Question(text: 'Ron Weasley et Hermione Granger sont les deux meilleurs amis de Harry Potter.', answer: true),
      Question(text: 'Le tome 2 se nomme "Harry Potter et la Chambre des Secrets".', answer: true),
      Question(text: 'Severus Rogue était le meilleur ami de James Potter.', answer: false),
      Question(
        text: 'Le tome 5 se nomme "Harry Potter et l\'Ordre du Phénix". À la fin, Voldemort revient aux yeux de tous et Sirius se fait tuer par Bellatrix Lestrange.', 
        answer: true),
    ])
  ];
}