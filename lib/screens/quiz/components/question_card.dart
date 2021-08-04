import 'package:flutter/material.dart';
import 'package:ricciwawa/constants.dart';
import 'package:ricciwawa/data/models/question.dart';

import 'option.dart';

class QuestionCard extends StatefulWidget {
  final Question question;
  final Function onOptionClick;
  const QuestionCard(
      {Key? key, required this.question, required this.onOptionClick})
      : super(key: key);

  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding / 2),
      child: Column(
        children: [
          Text(
            this.widget.question.questionText,
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: this.widget.question.options.length,
              itemBuilder: (BuildContext context, int index) {
                return OptionUI(
                  option: this.widget.question.options[index],
                  questionId: this.widget.question.questionId,
                  onClick: this.widget.onOptionClick,
                );
              })
        ],
      ),
    );
  }
}
