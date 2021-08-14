import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ricciwawa/constants.dart';
import 'package:ricciwawa/screens/components/post_quiz_stat.dart';

class QuizDoneByStudent extends StatefulWidget {
  const QuizDoneByStudent({Key? key}) : super(key: key);

  @override
  _QuizDoneByStudentState createState() => _QuizDoneByStudentState();
}

class _QuizDoneByStudentState extends State<QuizDoneByStudent> {
  void onItemClick() {
    Navigator.of(context).pushNamed("/answer_details");
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // print(size.height * .14);
    return Scaffold(
      backgroundColor: kDarkGrey2,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: size.height * .2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                NetworkImage("https://imgur.com/Mr6Rozm.png"))),
                  ),
                  Positioned(
                    bottom: -size.height * .05,
                    left: size.height * .03,
                    child: CircleAvatar(
                      radius: 35,
                      backgroundColor: kLightGreyColor,
                      backgroundImage:
                          NetworkImage("https://i.imgur.com/MGcuXst.png"),
                    ),
                  ),
                  Positioned(
                    bottom: -size.height * .06,
                    left: size.height * .14,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "DonaldTrump",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "@fintory",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Expanded(
                  child: PostQuizStatListView(
                onItemClick: onItemClick,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
