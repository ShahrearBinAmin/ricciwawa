import 'package:flutter/material.dart';
import 'package:ricciwawa/data/models/enums.dart';
import 'package:ricciwawa/data/repositories/dummy_data.dart';
import 'package:ricciwawa/screens/components/result_card.dart';

class UserAnswerDetailsScreen extends StatelessWidget {
  const UserAnswerDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "The Future of Labour",
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "DonaldTrump",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "5 - 8 - 2021     14:30",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  Text(
                    "88%",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 35),
                  )
                ],
              ),
            ),
            Expanded(
              child: ResultCardListView(
                  quiz: quiz_with_stat,
                  onPercentageClick: (_) {},
                  quizViewer: QuizViewer.EXAMINEE),
            )
          ],
        ),
      ),
    );
  }
}
