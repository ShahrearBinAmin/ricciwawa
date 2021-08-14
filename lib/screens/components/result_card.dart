import 'package:flutter/material.dart';
import 'package:ricciwawa/constants.dart';
import 'package:ricciwawa/data/models/enums.dart';
import 'package:ricciwawa/data/models/question.dart';
import 'package:ricciwawa/data/models/quiz.dart';
import 'package:ricciwawa/screens/statistics/statistics_screen.dart';

class ResultCardListView extends StatelessWidget {
  final Quiz quiz;
  final Function onPercentageClick;
  final QuizViewer quizViewer;
  const ResultCardListView(
      {Key? key,
      required this.quiz,
      required this.onPercentageClick,
      required this.quizViewer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemCount: quiz.questions.length,
        separatorBuilder: (_, index) => SizedBox(
              height: 10,
            ),
        itemBuilder: (BuildContext context, int index) {
          return QuestionOptionsResult(
              question: quiz.questions[index],
              onPercentageClick: onPercentageClick,
              quizViewer: quizViewer);
        });
  }
}

class QuestionOptionsResult extends StatelessWidget {
  final Question question;
  final Function onPercentageClick;
  final QuizViewer quizViewer;

  const QuestionOptionsResult(
      {Key? key,
      required this.question,
      required this.onPercentageClick,
      required this.quizViewer})
      : super(key: key);

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
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return ResultOptions(
                    question: question,
                    quizViewer: quizViewer,
                    option: question.options[index],
                    onPercentageClick: onPercentageClick,
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
  final Question question;
  final String correctOptionName;
  final Function onPercentageClick;
  final QuizViewer quizViewer;

  const ResultOptions(
      {Key? key,
      required this.option,
      required this.question,
      required this.correctOptionName,
      required this.onPercentageClick,
      required this.quizViewer})
      : super(key: key);

  Color calculateColor() {
    if (this.quizViewer == QuizViewer.EXAMINEE) {
      if (option.optionName == correctOptionName) {
        return kGreenColor;
      } else if (question.selectedOptionName == option.optionName &&
          question.selectedOptionName != correctOptionName) {
        return kRedColor;
      } else {
        return Colors.white;
      }
    } else {
      return option.optionName == correctOptionName
          ? kGreenColor
          : Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${this.option.optionName}. ${this.option.optionText}",
          style: TextStyle(color: calculateColor(), fontSize: 15),
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
        if (this.quizViewer == QuizViewer.CREATOR) ...[
          InkWell(
            onTap: () => onPercentageClick(question),
            child: Text(
              "${this.option.optionStat.percentage.round()}%",
              style: TextStyle(color: calculateColor(), fontSize: 15),
            ),
          )
        ]
      ],
    );
  }
}
