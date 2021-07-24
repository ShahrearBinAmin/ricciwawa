import 'package:flutter/material.dart';
import 'package:ricciwawa/constants.dart';

import 'option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding / 2),
      child: Column(
        children: [
          Text(
            "李明是李蛋的哥哥，劉云是李蛋的媽媽。李明是劉雲的誰？",
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Option(),
          Option(),
          Option(),
          Option(),
        ],
      ),
    );
  }
}
