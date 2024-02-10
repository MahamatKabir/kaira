import 'package:flutter/material.dart';
import 'package:kaira/screens/colors.dart';
import 'package:kaira/widget/curveimage.dart';
import 'package:kaira/widget/custom_text_container.dart';
import 'package:kaira/widget/mainbackground.dart';

class ExpenseListScreen extends StatelessWidget {
  const ExpenseListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: AppColor.backGroundColor,
        body: Container(
          height: h,
          child: Stack(
            children: [
              _headSection(),
              //_listBills(),
            ],
          ),
        ));
  }

  _headSection() {
    return Container(
      height: 310,
      child: const Stack(
        children: [
          MainBackground(
            bottomPosition: 10,
            leftPosition: 0,
            height: 300,
            imagePath: "images/background.png",
          ),
          CurveImageContainer(
            leftPosition: 0,
            rightPosition: -2,
            bottomPosition: 10,
            height: 10,
            imagePath: "images/curve.png",
          ),
          //_buttonContainer(),
          CustomTextContainer(
            text: "Liste des depenses",
            leftPosition: 0,
            topPosition: 110,
            color: Color(0xFF293952),
          ),
          CustomTextContainer(
            text: "Liste des depenses",
            leftPosition: 20,
            topPosition: 80,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
