import 'package:flutter/material.dart';
import 'package:ricciwawa/constants.dart';
import 'package:ricciwawa/data/models/question.dart';
import 'package:ricciwawa/screens/explanation/explanation.dart';

class AddOptionButton extends StatefulWidget {
  Function addNewOption;
  Function deleteOption;
  int currentIndex;
  int totalOptions;

  AddOptionButton(
      {Key? key,
      required this.currentIndex,
      required this.totalOptions,
      required this.addNewOption,
      required this.deleteOption})
      : super(key: key);

  @override
  _AddOptionButtonState createState() => _AddOptionButtonState();
}

class _AddOptionButtonState extends State<AddOptionButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        this.widget.addNewOption();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 11, horizontal: 8),
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white, width: 2)),
        child: Row(
          children: [
            Icon(
              Icons.circle_outlined,
              color: Colors.white,
              size: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Text(
              "Add Option",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ))
          ],
        ),
      ),
    );
  }
}
