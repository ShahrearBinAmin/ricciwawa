import 'package:flutter/material.dart';
import 'package:ricciwawa/constants.dart';
import 'package:ricciwawa/screens/components/student_post_quiz_result.dart';

class SelfQuizResultViewScreen extends StatefulWidget {
  const SelfQuizResultViewScreen({Key? key}) : super(key: key);

  @override
  _SelfQuizResultViewScreenState createState() =>
      _SelfQuizResultViewScreenState();
}

class _SelfQuizResultViewScreenState extends State<SelfQuizResultViewScreen> {
  void onItemClick() {
    Navigator.of(context).pushNamed("/answer_details");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightGreyColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Quiz",
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        leading: BackButton(color: Colors.black),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ))
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StudenPostQuizStatListView(onItemClick: onItemClick),
      ),
    );
  }
}
