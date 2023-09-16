import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riddles_app/constant/constant.dart';
import 'package:riddles_app/controller/question_controller.dart';

class Options extends StatelessWidget {
  const Options({
    super.key,
    required this.text,
    required this.index,
    required this.press,
  });
  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (qnController) {
          Color getTheRightColor() {
            if (qnController.isAnswered) {
              if (index == qnController.correctAnswer) {
                return kGreenColor;
              } else if (index == qnController.selectedAnswer &&
                  qnController.selectedAnswer != qnController.correctAnswer) {
                return kRedColor;
              }
            }
            return kgreyColor;
          }

          IconData getTheRightIcon() {
            return getTheRightColor() == kRedColor ? Icons.close : Icons.done;
          }

          return InkWell(
            onTap: press,
            child: Container(
              margin: const EdgeInsets.only(top: 15),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border: Border.all(color: getTheRightColor()),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${index + 1}. $text',
                    style: normalText(size: 18, color: getTheRightColor()),
                  ),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: getTheRightColor() == kgreyColor
                            ? Colors.transparent
                            : getTheRightColor(),
                        border: Border.all(color: getTheRightColor()),
                        borderRadius: BorderRadius.circular(50)),
                    child: getTheRightColor() == kgreyColor
                        ? null
                        : Icon(
                            getTheRightIcon(),
                            size: 16,
                            color: Colors.white,
                          ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
