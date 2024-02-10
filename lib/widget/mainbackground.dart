import 'package:flutter/material.dart';

class MainBackground extends StatelessWidget {
  final double bottomPosition;
  final double leftPosition;
  final double height;
  final String imagePath;

  const MainBackground({
    Key? key,
    required this.bottomPosition,
    required this.leftPosition,
    required this.height,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottomPosition,
      left: leftPosition,
      child: Container(
        height: height,
        width: MediaQuery.of(context).size.width,
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
