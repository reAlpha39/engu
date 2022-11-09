import 'package:engu/core/infrastructure/constant.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CoursesChapterTab extends StatelessWidget {
  const CoursesChapterTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: CustomColor.secondaryBgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: "CoursesChapterTab".text.white.makeCentered(),
    );
  }
}
