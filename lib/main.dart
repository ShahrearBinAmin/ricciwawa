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

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final QuizInfoBloc _quizInfoBloc = QuizInfoBloc(QuizInfoRepository());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/",
      theme: ThemeData(fontFamily: "Montserrat"),
      // home: BlocProvider(
      //   create: (context) => QuizInfoBloc(QuizInfoRepository()),
      //   child: CreateQuiz(),
      // ),
      routes: {
        '/': (context) => Home(),
        '/answer_quiz': (context) => BlocProvider.value(
              value: _quizInfoBloc,
              child: QuizScreen(),
            ),
        '/create_quiz': (context) => BlocProvider.value(
              value: _quizInfoBloc,
              child: CreateQuiz(),
            ),
        '/quiz_stat': (context) => BlocProvider.value(
              value: _quizInfoBloc,
              child: ResultsScreen(),
            ),
      },
    );
  }

  @override
  void dispose() {
    _quizInfoBloc.close();
    super.dispose();
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ricciwawa (Q&A)"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/answer_quiz");
                },
                child: Text("Answer Question")),
            OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/create_quiz");
                },
                child: Text("Create Quiz")),
            OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/quiz_stat");
                },
                child: Text("Quiz Stat")),
          ],
        ),
      ),
    );
  }
}
