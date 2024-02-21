import 'package:flutter/material.dart';
import 'package:quizzer_vrs2/data/Quizz.dart';
import 'package:quizzer_vrs2/views/QuizzPage.dart';
import 'package:quizzer_vrs2/data/QuizzData.dart';

class HomePage extends StatelessWidget {
  final List<Quiz> quizzes = QuizData.quizzes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1.5,
        ),
        itemCount: quizzes.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizPage(quiz: quizzes[index]),
                  ),
                );
              },
              child: Center(
                child: Text(
                  quizzes[index].title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
