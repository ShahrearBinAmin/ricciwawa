import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ricciwawa/constants.dart';
import 'package:ricciwawa/data/models/question.dart';
import 'package:ricciwawa/data/models/quiz.dart';
import 'package:ricciwawa/logic/bloc/quiz_info_bloc.dart';
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
              return buildColumnWithData(state.quiz);
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

  // Column buildColumnWithData(Quiz quiz) {
  //   return Column(
  //     children: [
  //       QuestionOptionsResult(),
  //       SizedBox(
  //         height: 10,
  //       ),
  //       QuestionOptionsResult(),
  //       SizedBox(
  //         height: 10,
  //       ),
  //       QuestionOptionsResult()
  //     ],
  //   );
  // }

  Widget buildColumnWithData(Quiz quiz) {
    return ListView.separated(
        itemCount: quiz.questions.length,
        separatorBuilder: (_, index) => SizedBox(
              height: 10,
            ),
        itemBuilder: (BuildContext context, int index) {
          return QuestionOptionsResult(
            question: quiz.questions[index],
          );
        });
  }
}

class QuestionOptionsResult extends StatelessWidget {
  final Question question;
  const QuestionOptionsResult({Key? key, required this.question})
      : super(key: key);

  void navigateStatScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => StatisticsScreen(question: question)));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      decoration: BoxDecoration(
          color: kDarkGrey, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "Q${question.position}. ${question.questionText}",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Icon(
                  Icons.help,
                  color: Colors.white,
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            height: 2,
            color: Colors.white,
          ),
          SizedBox(
            height: 10,
          ),
          ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return ResultOptions(
                    option: question.options[index],
                    onPercentageClick: navigateStatScreen,
                    correctOptionName: question.correctOptionName);
              },
              separatorBuilder: (BuildContext context, int index) => SizedBox(
                    height: 5,
                  ),
              itemCount: question.options.length)
        ],
      ),
    );
  }
}

class ResultOptions extends StatelessWidget {
  final Option option;
  final String correctOptionName;
  final Function onPercentageClick;
  const ResultOptions(
      {Key? key,
      required this.option,
      required this.correctOptionName,
      required this.onPercentageClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color _color =
        option.optionName == correctOptionName ? kGreenColor : Colors.white;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${this.option.optionName}. ${this.option.optionText}",
          style: TextStyle(color: _color, fontSize: 15),
        ),
        // if (this.option.optionName == this.correctOptionName) ...[
        //   SizedBox(
        //     width: 5,
        //   ),
        //   Icon(
        //     Icons.check_circle_outline,
        //     color: Colors.white,
        //     size: 20,
        //   ),
        // ],
        Spacer(),
        InkWell(
          onTap: () => onPercentageClick(context),
          child: Text(
            "${this.option.optionStat.percentage.round()}%",
            style: TextStyle(color: _color, fontSize: 15),
          ),
        )
      ],
    );
  }
}
