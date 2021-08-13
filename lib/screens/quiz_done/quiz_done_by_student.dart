import 'package:flutter/material.dart';
import 'package:ricciwawa/constants.dart';

class QuizDoneByStudent extends StatelessWidget {
  const QuizDoneByStudent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                    bottom: -20,
                    left: 20,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: kLightGreyColor,
                          backgroundImage:
                              NetworkImage("https://i.imgur.com/MGcuXst.png"),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 50),
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
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PostQuizStat extends StatelessWidget {
  const PostQuizStat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network("https://imgur.com/uHZ3Mim.png"),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "The Future of Labour People’s Republic of China",
                maxLines: 2,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "5 - 8 - 2021     14:30",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "88%",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
          )
        ],
      ),
    );
  }
}
