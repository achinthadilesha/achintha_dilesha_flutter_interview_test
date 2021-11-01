import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final Color color;
  final double fontSize;
  final TextAlign textAlign;

  const CustomText({
    Key? key,
    required this.text,
    this.fontWeight = FontWeight.normal,
    required this.color,
    required this.fontSize,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight,
        color: color,
        fontSize: fontSize,
      ),
      textAlign: textAlign,
    );
  }
}
