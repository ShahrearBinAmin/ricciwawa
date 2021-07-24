import 'package:flutter/material.dart';
import 'package:ricciwawa/constants.dart';

class CustomTextButton extends StatelessWidget {
  final String buttonText;
  final Color backgroundColor;
  final EdgeInsets margin;

  const CustomTextButton(
      {Key? key,
      required this.buttonText,
      this.backgroundColor = kGrayBorderColor,
      this.margin = const EdgeInsets.symmetric(horizontal: 10)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          margin: margin,
          padding: EdgeInsets.all(kDefaultPadding * .5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              border: Border.all(color: Colors.black),
              color: backgroundColor),
          child: Text(
            buttonText.toUpperCase(),
            style: new TextStyle(
                fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
