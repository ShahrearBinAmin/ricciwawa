import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:ricciwawa/constants.dart';
import 'package:ricciwawa/data/models/answer_quiz.dart';

class QuizResult extends StatelessWidget {
  final AnswerInfo answerInfo;
  const QuizResult({Key? key, required this.answerInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(
              flex: 2,
            ),
            Text(
              "Quiz Result",
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Text("${answerInfo.percentage}%",
                style: Theme.of(context).textTheme.headline2?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 30,
            ),
            Text("Great Job!",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: Colors.white)),
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width * .6,
              child: Divider(
                thickness: 2,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircledIcon(
                  icon: Icons.done,
                ),
                SizedBox(width: 10),
                Text(
                  "${answerInfo.correct} Correct",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: Colors.white),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircledIcon(
                    icon: Icons.close,
                  ),
                  SizedBox(width: 10),
                  Text("${answerInfo.wrong} to work on",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(color: Colors.white))
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  //Navigator.pop(context);
                  _onAlertButtonsPressed(context);
                },
                child: Text(
                  "Retake Quiz",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: Colors.white, fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                    primary: kFlushOragne,
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)))),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }

  _onAlertButtonsPressed(context) {
    Alert(
      context: context,
      type: AlertType.warning,
      title: "UNRATED QUIZ",
      desc: "Only first quiz attempt is saved.",
      buttons: [
        DialogButton(
          child: Text(
            "BACK",
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.pop(context);
          },
          color: kRedColor,
        ),
        DialogButton(
            child: Text(
              "PROCEED",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.of(context).pushNamed("/answer_quiz");
            },
            color: kGreenColor)
      ],
    ).show();
  }
}

class CircledIcon extends StatelessWidget {
  final IconData icon;
  const CircledIcon({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 24,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.white)),
      child: Icon(icon, size: 20, color: Colors.white),
    );
  }
}
