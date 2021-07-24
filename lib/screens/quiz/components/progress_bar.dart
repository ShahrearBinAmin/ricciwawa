import 'package:flutter/material.dart';
import 'package:ricciwawa/constants.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
  }) : super(key: key);

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
              width: constraints.maxWidth * 0.5,
              decoration: BoxDecoration(
                  color: kGreenColor, borderRadius: BorderRadius.circular(50)),
            ),
          ),
        ],
      ),
    );
  }
}
