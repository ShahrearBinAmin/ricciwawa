import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ricciwawa/constants.dart';
import 'package:ricciwawa/data/repositories/quiz_repository.dart';
import 'package:ricciwawa/logic/bloc/quiz_info_bloc.dart';
import 'package:ricciwawa/screens/create_quiz/create_quiz_screen.dart';
import 'package:ricciwawa/screens/explanation/explanation.dart';
import 'package:ricciwawa/screens/post/post_screen.dart';
import 'package:ricciwawa/screens/quiz/quiz_screen.dart';
import 'package:ricciwawa/screens/quiz_result/quiz_result.dart';
import 'package:ricciwawa/screens/results/results_screen.dart';
import 'package:ricciwawa/screens/statistics/statistics_screen.dart';
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
      home: BlocProvider(
        create: (context) => QuizInfoBloc(QuizInfoRepository()),
        child: QuizScreen(),
      ),
    );
  }
}
