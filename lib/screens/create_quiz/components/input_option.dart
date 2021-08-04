import 'package:flutter/material.dart';
import 'package:ricciwawa/constants.dart';
import 'package:ricciwawa/screens/explanation/explanation.dart';

class InputOption extends StatefulWidget {
  final String optionId;
  final String optionText;
  bool correctOption;

  InputOption(
      {Key? key,
      required this.optionId,
      required this.optionText,
      this.correctOption = false})
      : super(key: key);

  @override
  _InputOptionState createState() => _InputOptionState();
}

class _InputOptionState extends State<InputOption> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      decoration: BoxDecoration(
          color: widget.correctOption ? kGreenColor : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: widget.correctOption ? kGreenColor : Colors.white,
              width: 2)),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2)),
            child: InkWell(
              child: Text(
                widget.optionId,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 15),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  hintText: widget.optionText,
                  border: InputBorder.none,
                  suffixIcon: widget.correctOption
                      ? InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ExplanationScreen()));
                          },
                          child: Icon(
                            Icons.help,
                            color: Colors.white,
                            size: 30,
                          ),
                        )
                      : null,
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }
}
