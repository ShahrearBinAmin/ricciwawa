import 'package:flutter/material.dart';
import 'package:ricciwawa/constants.dart';
import 'package:ricciwawa/data/models/question.dart';
import 'package:ricciwawa/utils/util.dart';

import 'components/input_option.dart';

class CreateQuiz extends StatefulWidget {
  const CreateQuiz({Key? key}) : super(key: key);

  @override
  _CreateQuizState createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  List<Question> _questions = [
    generateQuestion(1),
  ];

  void onDeleteQuestion(String questionId) {
    setState(() {
      _questions = _questions
          .where((element) => element.questionId != questionId)
          .toList();
    });
  }

  void onDuplicateQuestion(String questionId) {
    Question currentQuestion =
        _questions.firstWhere((element) => element.questionId == questionId);
    Question _copiedQuestion = currentQuestion.copyWith(
        questionId: (_questions.length + 1).toString());
    _questions.add(_copiedQuestion);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Test",
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: ElevatedButton(
              onPressed: () {
                for (var q in _questions) {
                  print(q);
                }
              },
              child: Text("Save",
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w500)),
              style: ElevatedButton.styleFrom(primary: kDarkRed),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              // CreatedQuestionCard(),
              // SizedBox(
              //   height: 15,
              // ),
              ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return CreationQuestionCard(
                      question: _questions[index],
                      onDelete: onDeleteQuestion,
                      onDuplicate: onDuplicateQuestion,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                        height: 15,
                      ),
                  itemCount: _questions.length),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      _questions.add(generateQuestion(_questions.length + 1));
                      setState(() {});
                    },
                    child: Icon(
                      Icons.add_circle_outline,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CreationQuestionCard extends StatefulWidget {
  Question question;
  Function onDelete;
  Function onDuplicate;
  CreationQuestionCard(
      {Key? key,
      required this.question,
      required this.onDelete,
      required this.onDuplicate})
      : super(key: key);

  @override
  _CreationQuestionCardState createState() => _CreationQuestionCardState();
}

class _CreationQuestionCardState extends State<CreationQuestionCard> {
  // List<Option> _currentOptions = List.generate(
  //     2,
  //     (index) => Option(
  //         optionId: "${index + 1}",
  //         optionName: "${index + 1}",
  //         optionText: "${index + 1}",
  //         optionStat: generateOptionSate()));

  void onSelectCorrectOption(String optionName) {
    this.widget.question.correctOptionName = optionName;
    setState(() {});
  }

  void addOption() {
    this.widget.question.addOption(
        generateOption("${this.widget.question.options.length + 1}"));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: kDarkGrey, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: kLightGreyColor,
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    maxLines: 3,
                    minLines: 1,
                    onChanged: (String text) {
                      widget.question.questionText = text;
                    },
                    decoration: InputDecoration(
                        hintText: "Type your question here...",
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF7E7E7E))),
                  ),
                ),
                // InkWell(
                //   onTap: () {},
                //   child: Icon(
                //     Icons.more_vert,
                //     color: Colors.black,
                //   ),
                // )
                PopupMenuButton<CardAction>(
                  onSelected: (CardAction result) {
                    if (result == CardAction.Delete) {
                      widget.onDelete(widget.question.questionId);
                    } else if (result == CardAction.Duplicate) {
                      widget.onDuplicate(widget.question.questionId);
                    }
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<CardAction>>[
                    const PopupMenuItem<CardAction>(
                        value: CardAction.Duplicate, child: Text("Duplicate")),
                    const PopupMenuItem<CardAction>(
                        value: CardAction.Delete, child: Text("Delete"))
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: ListView.separated(
                itemCount: widget.question.options.length,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (_, indx) => SizedBox(
                      height: 10,
                    ),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return InputOption(
                      addNewOption: addOption,
                      currentIndex: index,
                      totalOptions: widget.question.options.length,
                      onSelectCorrectOption: onSelectCorrectOption,
                      option: widget.question.options[index],
                      correctOption: widget.question.correctOptionName ==
                          widget.question.options[index].optionName,
                      optionHintText:
                          "Option ${widget.question.options[index].optionName}");
                }),
          ),
        ],
      ),
    );
  }
}

// IconInCircle(
//     icon: Icons.add,
//   ),
//   IconInCircle(
//     icon: Icons.done,
//   ),
//   Icon(
//     Icons.check_circle_outline,
//     color: Colors.white,
//     size: 30,
//   ),
//   Icon(
//     Icons.add_circle_outline,
//     color: Colors.white,
//     size: 30,
//   ),

// Icon(
//     Icons.help,
//     color: Colors.white,
//     size: 30,
//   )

class IconInCircle extends StatelessWidget {
  final IconData icon;
  const IconInCircle({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.white, width: 2)),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
