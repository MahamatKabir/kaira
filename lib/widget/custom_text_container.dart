import 'package:flutter/material.dart';

class CustomTextContainer extends StatelessWidget {
  final String text;
  final double leftPosition;
  final double topPosition;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  const CustomTextContainer({
    Key? key,
    required this.text,
    required this.leftPosition,
    required this.topPosition,
    this.fontSize = 30,
    this.fontWeight = FontWeight.bold,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: leftPosition,
      top: topPosition,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
    );
  }
}
