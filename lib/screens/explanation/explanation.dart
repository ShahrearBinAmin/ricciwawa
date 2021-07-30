import 'package:flutter/material.dart';
import 'package:ricciwawa/constants.dart';

class ExplanationScreen extends StatelessWidget {
  const ExplanationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Explanation",
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Center(
            child: TextField(
              maxLines: 30,
              decoration: InputDecoration(
                hintText: "Type your explanation here...",
                hintStyle: TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xFF7E7E7E)),
                filled: true,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                fillColor: kDarkGrey,
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.7),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(25.7),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
