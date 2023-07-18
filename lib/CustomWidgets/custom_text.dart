import 'package:flutter/material.dart';


class CustomText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontsize;
  final FontStyle? fontStyle;
  final Color colors;

  const CustomText({Key? key, required this.text, required this.fontWeight, required this.colors, this.fontStyle, required this.fontsize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
       // letterSpacing: 1,
        fontWeight: fontWeight,
        fontSize: fontsize,
        color: colors,
        fontStyle: fontStyle,
      ),
    );
  }
}
