import 'package:flutter/material.dart';
import 'package:quizzer_vrs2/views/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Quizz',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 76, 119, 139)),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage());
  }
}
