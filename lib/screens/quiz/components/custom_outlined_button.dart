import 'package:flutter/material.dart';
import 'package:ricciwawa/constants.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String buttonText;
  final EdgeInsets margin;
  final Function onClick;
  const CustomOutlinedButton(
      {Key? key,
      required this.buttonText,
      this.margin = const EdgeInsets.symmetric(horizontal: 10),
      required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => onClick(),
        child: Container(
          margin: margin,
          alignment: Alignment.center,
          padding: EdgeInsets.all(kDefaultPadding * .5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            border: Border.all(color: kAstral, width: kBorderWidth),
          ),
          child: Text(
            buttonText.toUpperCase(),
            style: new TextStyle(
                fontSize: 14, color: kAstral, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
