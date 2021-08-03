import 'package:flutter/material.dart';
import 'package:ricciwawa/constants.dart';

import 'components/custom_outlined_button.dart';
import 'components/custom_text_button.dart';
import 'components/progress_bar.dart';
import 'components/question_card.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [],
      ),
      body: Container(
        decoration: BoxDecoration(color: kSecondaryColor),
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
                child: ProgressBar(),
              ),
              Spacer(
                flex: 1,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
                child: QuestionCard(),
              ),
              Spacer(
                flex: 4,
              ),
              // BottomButtons(),
              SizedBox(
                height: 20,
              ),
              AnswerExplanation(
                correctOrWrong: kGreenColor,
              ),
            ],
          ),
        )),
      ),
    );
  }
}

class AnswerExplanation extends StatelessWidget {
  final Color correctOrWrong;
  const AnswerExplanation({Key? key, required this.correctOrWrong})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    "兒子",
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                        color: correctOrWrong, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "兒子 is correct because 李明 is 李蛋’s brother. If 李蛋’s mother is 劉雲 , then 李明 ‘s mother is 劉雲 too.",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(color: correctOrWrong),
              ),
              SizedBox(
                height: 15,
              ),
              BottomButtons(correctOrWrong: correctOrWrong),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ));
  }
}

class BottomButtons extends StatelessWidget {
  final Color? correctOrWrong;
  const BottomButtons({
    Key? key,
    this.correctOrWrong,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomOutlinedButton(
          buttonText: "Previous",
        ),
        CustomTextButton(
          buttonText: "Next",
          backgroundColor: correctOrWrong ?? kGrayBorderColor,
        ),
      ],
    );
  }
}
