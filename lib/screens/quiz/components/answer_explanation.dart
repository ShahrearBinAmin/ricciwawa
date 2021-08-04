import 'package:flutter/material.dart';
import 'package:ricciwawa/constants.dart';
import 'package:ricciwawa/data/models/question.dart';
import 'package:ricciwawa/screens/quiz/quiz_screen.dart';

class AnswerExplanation extends StatelessWidget {
  final Color correctOrWrong;
  final Function onNext;
  final Function onPrevious;
  final Question question;
  const AnswerExplanation(
      {Key? key,
      required this.correctOrWrong,
      required this.onNext,
      required this.onPrevious,
      required this.question})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String correctOptionText = question.options
        .firstWhere((element) => element.optionId == question.correctOptionId)
        .optionText;

    return Container(
        color: kSecondaryColorLight,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
              kDefaultPadding / 2, kDefaultPadding / 2, kDefaultPadding / 2, 0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Answer:",
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                        color: correctOrWrong, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "$correctOptionText",
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                        color: correctOrWrong, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "${question.explanation}",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(color: correctOrWrong),
              ),
              SizedBox(
                height: 15,
              ),
              BottomButtons(
                correctOrWrong: correctOrWrong,
                onNext: onNext,
                onPrevious: onPrevious,
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ));
  }
}
