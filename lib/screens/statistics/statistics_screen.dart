import 'package:flutter/material.dart';
import 'package:ricciwawa/constants.dart';
import 'package:ricciwawa/data/models/question.dart';

class StatisticsScreen extends StatefulWidget {
  final Question question;
  const StatisticsScreen({Key? key, required this.question}) : super(key: key);

  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  @override
  Widget build(BuildContext context) {
    Question _question = widget.question;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Statistics",
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Container(
          child: Column(
            children: [
              QuestionText(question: _question),
              ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        OptionStats(
                          option: _question.options[index],
                        ),
                        UserList(option: _question.options[index])
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                        height: 15,
                      ),
                  itemCount: _question.options.length),
            ],
          ),
        ),
      ),
    );
  }
}

class QuestionText extends StatelessWidget {
  const QuestionText({
    Key? key,
    required Question question,
  })  : _question = question,
        super(key: key);

  final Question _question;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text("Q${_question.position}. ${_question.questionText}",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17)),
    );
  }
}

class UserList extends StatelessWidget {
  const UserList({
    Key? key,
    required Option option,
  })  : _option = option,
        super(key: key);

  final Option _option;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      color: Color(0xFF262626),
      child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int innerIndex) {
            var user = _option.optionStat.answeredUsers[innerIndex];
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: kLightGreyColor,
              ),
              title: Text(
                user.name,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => SizedBox(
                height: 0,
              ),
          itemCount: _option.optionStat.answeredUsers.length),
    );
  }
}

class OptionStats extends StatelessWidget {
  final Option option;
  const OptionStats({Key? key, required this.option}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var optionStat = option.optionStat;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "${option.optionText}-${optionStat.percentage.round()}%",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          Text(
            "${optionStat.answeredUsersCount} Votes",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
