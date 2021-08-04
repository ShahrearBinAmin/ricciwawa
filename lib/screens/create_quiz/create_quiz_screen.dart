import 'package:flutter/material.dart';
import 'package:ricciwawa/constants.dart';

import 'components/input_option.dart';

class CreateQuiz extends StatelessWidget {
  const CreateQuiz({Key? key}) : super(key: key);

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
              onPressed: () {},
              child: Text("Save",
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w500)),
              style: ElevatedButton.styleFrom(primary: kDarkRed),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            CreatedQuestionCard(),
            SizedBox(
              height: 15,
            ),
            CreationQuestionCard(),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(
                  Icons.add_circle_outline,
                  color: Colors.white,
                  size: 35,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CreatedQuestionCard extends StatelessWidget {
  const CreatedQuestionCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _textEditingController = TextEditingController();
    _textEditingController.text = "李明是李蛋的哥哥，劉云是李蛋的媽媽。李明是劉云的誰？";

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
                    controller: _textEditingController,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF7E7E7E))),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.more_vert,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              children: [
                InputOption(
                  optionId: " ",
                  optionText: "媽媽",
                  correctOption: true,
                ),
                SizedBox(
                  height: 10,
                ),
                InputOption(
                  optionId: " ",
                  optionText: "爸爸",
                ),
                SizedBox(
                  height: 10,
                ),
                InputOption(
                  optionId: " ",
                  optionText: "媽媽",
                ),
                SizedBox(
                  height: 10,
                ),
                InputOption(
                  optionId: " ",
                  optionText: "爸爸",
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CreationQuestionCard extends StatelessWidget {
  const CreationQuestionCard({
    Key? key,
  }) : super(key: key);

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
                    decoration: InputDecoration(
                        hintText: "Type your question here...",
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF7E7E7E))),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.more_vert,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              children: [
                InputOption(
                  optionId: " ",
                  optionText: "Option 1",
                ),
                SizedBox(
                  height: 10,
                ),
                InputOption(
                  optionId: " ",
                  optionText: "Option 2",
                )
              ],
            ),
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
