import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ricciwawa/constants.dart';
import 'package:ricciwawa/data/models/enums.dart';
import 'package:ricciwawa/data/models/question.dart';
import 'package:ricciwawa/data/models/quiz.dart';
import 'package:ricciwawa/logic/bloc/quiz_info_bloc.dart';
import 'package:ricciwawa/screens/components/result_card.dart';
import 'package:ricciwawa/screens/statistics/statistics_screen.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({Key? key}) : super(key: key);

  @override
  _ResultsScreenState createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  @override
  void initState() {
    // TODO: implement initState

    context.read<QuizInfoBloc>().add(GetQuizStat("1"));
    super.initState();
  }

  void navigateStatScreen(Question question) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => StatisticsScreen(question: question)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Results",
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: BlocConsumer<QuizInfoBloc, QuizInfoState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is QuizInfoLoaded) {
              return ResultCardListView(
                  quiz: state.quiz,
                  quizViewer: QuizViewer.CREATOR,
                  onPercentageClick: navigateStatScreen);
            } else {
              return Container(
                width: 0,
                height: 0,
              );
            }
          },
        ),
      ),
    );
  }
}
