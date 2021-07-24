import 'package:flutter/material.dart';
import 'package:ricciwawa/constants.dart';
import 'package:ricciwawa/screens/quiz/quiz_screen.dart';
import 'package:ricciwawa/screens/quiz_result/quiz_result.dart';
import 'package:ricciwawa/theme/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: "Montserrat"),
      home: QuizResult(),
    );
  }
}
