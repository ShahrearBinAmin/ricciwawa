import 'package:flutter/material.dart';
import 'package:ricciwawa/constants.dart';

class Option extends StatelessWidget {
  const Option({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: kDefaultPadding),
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
      decoration: BoxDecoration(
          border: Border.all(color: kGrayBorderColor, width: kBorderWidth),
          borderRadius: BorderRadius.circular(50)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              "A",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            "兒子",
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
