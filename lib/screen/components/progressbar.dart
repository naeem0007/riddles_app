import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riddles_app/constant/constant.dart';
import 'package:riddles_app/controller/question_controller.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: 2,
            color: Colors.white,
          )),
      child: GetBuilder<QuestionController>(
          init: QuestionController(),
          builder: (controller) {
            return Stack(
              children: [
                LayoutBuilder(
                  builder: (context, constraints) => Container(
                    width: constraints.maxWidth * controller.animation.value,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: primaryGradient),
                  ),
                ),
                Positioned.fill(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${(controller.animation.value * 60).round()} sec',
                        style: semiBoldText(color: Colors.white),
                      ),
                      const Icon(
                        CupertinoIcons.clock,
                        color: Colors.white,
                      )
                    ],
                  ),
                ))
              ],
            );
          }),
    );
  }
}
