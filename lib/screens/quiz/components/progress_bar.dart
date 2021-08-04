import 'package:flutter/material.dart';
import 'package:ricciwawa/constants.dart';

class ProgressBar extends StatefulWidget {
  final double percentage;
  const ProgressBar({Key? key, required this.percentage}) : super(key: key);

  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 18,
      decoration: BoxDecoration(
          color: kGrayBorderColor, borderRadius: BorderRadius.circular(50)),
      child: Stack(
        children: [
          LayoutBuilder(
            builder: (context, constraints) => Container(
              width: constraints.maxWidth * this.widget.percentage,
              decoration: BoxDecoration(
                  color: kGreenColor, borderRadius: BorderRadius.circular(50)),
            ),
          ),
        ],
      ),
    );
  }
}
