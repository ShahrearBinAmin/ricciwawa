import 'package:flutter/material.dart';
import 'package:ricciwawa/constants.dart';
import 'package:ricciwawa/data/models/question.dart';

class OptionUI extends StatefulWidget {
  final Option option;
  Function onClick;
  String questionId;
  final bool isSelected;
  OptionUI(
      {Key? key,
      required this.option,
      required this.onClick,
      required this.questionId,
      required this.isSelected})
      : super(key: key);

  @override
  _OptionUIState createState() => _OptionUIState();
}

class _OptionUIState extends State<OptionUI> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        this
            .widget
            .onClick(this.widget.option.optionName, this.widget.questionId);
      },
      child: Container(
        margin: EdgeInsets.only(top: kDefaultPadding),
        padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
        decoration: BoxDecoration(
            border: Border.all(
                color: this.widget.isSelected
                    ? Color(0xFF3B89A6)
                    : kGrayBorderColor,
                width: kBorderWidth),
            borderRadius: BorderRadius.circular(50)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                this.widget.option.optionName,
                style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              this.widget.option.optionText,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
