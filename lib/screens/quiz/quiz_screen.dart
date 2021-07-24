import 'package:flutter/material.dart';
import 'package:ricciwawa/constants.dart';

import 'components/custom_outlined_button.dart';
import 'components/custom_text_button.dart';
import 'components/progress_bar.dart';
import 'components/question_card.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

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
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
          child: Column(
            children: [
              ProgressBar(),
              Spacer(
                flex: 1,
              ),
              QuestionCard(),
              Spacer(
                flex: 4,
              ),
              Row(
                children: [
                  CustomOutlinedButton(
                    buttonText: "Previous",
                  ),
                  CustomTextButton(
                    buttonText: "Next",
                  ),
                ],
              ),
              Spacer(
                flex: 2,
              )
            ],
          ),
        )),
      ),
    );
  }
}
