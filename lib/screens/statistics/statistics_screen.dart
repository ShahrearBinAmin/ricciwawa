import 'package:flutter/material.dart';
import 'package:ricciwawa/data/models/user.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              Text("Q1. 李明是李蛋的哥哥，劉云是李蛋的媽媽。李明是劉云的誰？",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17)),
              OptionSelectorDetails()
            ],
          ),
        ),
      ),
    );
  }
}

class OptionSelectorDetails extends StatelessWidget {
  final items = List.generate(
      10,
      (counter) => User(
          userId: counter.toString(),
          name: '@Sammid',
          email: "test@gmail.com",
          userPhoto: "t"));
  final 
  const OptionSelectorDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "爸爸-0%",
          style: TextStyle(color: Colors.white),
        ),
        Text(
          "0 Votes",
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
