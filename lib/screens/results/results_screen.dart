import 'package:flutter/material.dart';
import 'package:ricciwawa/constants.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({Key? key}) : super(key: key);

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
        child: Column(
          children: [
            QuestionOptionsResult(),
            SizedBox(
              height: 10,
            ),
            QuestionOptionsResult(),
            SizedBox(
              height: 10,
            ),
            QuestionOptionsResult()
          ],
        ),
      ),
    );
  }
}

class QuestionOptionsResult extends StatelessWidget {
  const QuestionOptionsResult({
    Key? key,
  }) : super(key: key);

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
                  "Q1. 李明是李蛋的哥哥，劉云是李蛋的媽媽。李明是劉云的誰？",
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
          ResultOptions(
            id: "a",
            optionName: "A",
            correctOptionName: "A",
            optionText: "爸爸",
            percentage: 99.4,
          ),
          ResultOptions(
            id: "a",
            optionName: "B",
            correctOptionName: "A",
            optionText: "爸爸",
            percentage: 10,
          ),
          ResultOptions(
            id: "a",
            optionName: "C",
            correctOptionName: "A",
            optionText: "爸爸",
            percentage: 10,
          ),
          ResultOptions(
            id: "a",
            optionName: "D",
            correctOptionName: "A",
            optionText: "爸爸",
            percentage: 10,
          )
        ],
      ),
    );
  }
}

class ResultOptions extends StatelessWidget {
  final String id;
  final String optionName;
  final String optionText;
  final double percentage;
  final String correctOptionName;
  const ResultOptions(
      {Key? key,
      required this.id,
      required this.optionName,
      required this.optionText,
      required this.percentage,
      required this.correctOptionName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${this.optionName}. ${this.optionText}",
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        if (this.optionName == this.correctOptionName) ...[
          SizedBox(
            width: 5,
          ),
          Icon(
            Icons.check_circle_outline,
            color: Colors.white,
            size: 20,
          ),
        ],
        Spacer(),
        Text(
          "${this.percentage.round()}%",
          style: TextStyle(color: Colors.white, fontSize: 15),
        )
      ],
    );
  }
}
