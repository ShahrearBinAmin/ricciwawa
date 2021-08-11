import 'package:flutter/material.dart';
import 'package:ricciwawa/constants.dart';
import 'package:ricciwawa/data/models/question.dart';
import 'package:ricciwawa/screens/explanation/explanation.dart';

class InputOption extends StatefulWidget {
  String optionHintText;
  Option option;
  bool correctOption;
  bool setDefaultValues;
  Function onSelectCorrectOption;
  Function addNewOption;
  Function deleteOption;
  int currentIndex;
  int totalOptions;

  InputOption(
      {Key? key,
      required this.optionHintText,
      required this.option,
      this.correctOption = false,
      this.setDefaultValues = false,
      required this.onSelectCorrectOption,
      required this.currentIndex,
      required this.totalOptions,
      required this.addNewOption,
      required this.deleteOption})
      : super(key: key);

  @override
  _InputOptionState createState() => _InputOptionState();
}

class _InputOptionState extends State<InputOption> {
  late TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController(
        text: widget.setDefaultValues ? widget.option.optionText : '');

    super.initState();
  }

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
          if (widget.correctOption) ...[
            InkWell(
              onTap: () {
                widget.onSelectCorrectOption(widget.option.optionName);
              },
              child: Icon(
                Icons.check_circle_outline,
                color: Colors.white,
                size: 30,
              ),
            )
          ] else ...[
            // Container(
            //   padding: EdgeInsets.all(8),
            //   decoration: BoxDecoration(
            //       shape: BoxShape.circle,
            //       border: Border.all(color: Colors.white, width: 2)),
            //   child: InkWell(
            //     child: Text(
            //       " ",
            //       textAlign: TextAlign.center,
            //       style: TextStyle(
            //           fontWeight: FontWeight.bold,
            //           color: Colors.white,
            //           fontSize: 15),
            //     ),
            //   ),
            // )
            InkWell(
              onTap: () {
                widget.onSelectCorrectOption(widget.option.optionName);
              },
              child: Icon(
                Icons.circle_outlined,
                color: Colors.white,
                size: 30,
              ),
            )
          ],
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              style: TextStyle(color: Colors.white),
              controller: _controller,
              onChanged: (String text) {
                widget.option.optionText = text;
              },
              onEditingComplete: () {},
              onSubmitted: (String text) {
                if (widget.currentIndex == widget.totalOptions - 1 &&
                    widget.totalOptions <= 5) {
                  widget.addNewOption();
                }
              },
              decoration: InputDecoration(
                  hintText: widget.optionHintText,
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
                      : InkWell(
                          onTap: () {
                            this.widget.deleteOption(widget.option.optionName);
                          },
                          child:
                              Icon(Icons.close, color: Colors.white, size: 30)),
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
