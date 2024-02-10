import 'package:flutter/material.dart';

class CurveImageContainer extends StatelessWidget {
  final double leftPosition;
  final double rightPosition;
  final double bottomPosition;
  final double height;
  final String imagePath;

  const CurveImageContainer({
    Key? key,
    required this.leftPosition,
    required this.rightPosition,
    required this.bottomPosition,
    required this.height,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: leftPosition,
      right: rightPosition,
      bottom: bottomPosition,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(imagePath),
          ),
        ),
      ),
    );
  }
}
