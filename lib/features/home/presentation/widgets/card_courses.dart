import 'package:engu/core/infrastructure/constant.dart';
import 'package:engu/features/home/data/models/courses/courses.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:velocity_x/velocity_x.dart';

class CardCourse extends StatelessWidget {
  final Courses data;
  const CardCourse({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed('course', extra: data),
      child: Container(
        decoration: BoxDecoration(
          color: CustomColor.secondaryBgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                data.name.text
                    .color(CustomColor.primaryColor)
                    .size(12)
                    .semiBold
                    .make(),
                const SizedBox(height: 4),
                data.description.text.size(10).black.make()
              ],
            ).expand(),
            Container(
              height: 35,
              width: 35,
              decoration: const BoxDecoration(
                color: CustomColor.primaryColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 25,
              ),
            )
          ],
        ).p16(),
      ).pOnly(bottom: 12),
    );
  }
}
