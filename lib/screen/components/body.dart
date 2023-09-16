import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riddles_app/constant/constant.dart';
import 'package:riddles_app/controller/question_controller.dart';
import 'package:riddles_app/models/levels/levels.dart';

import 'package:riddles_app/screen/components/progressbar.dart';
import 'package:riddles_app/screen/components/question_card.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    QuestionController questionController = Get.put(QuestionController());
    final pageController = questionController
        .getPageControllerForLevel(questionController.currentLevel.id);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProgressBar(),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => Text.rich(TextSpan(
                  text: 'Riddles ${questionController.questionNumber.value}',
                  style: semiBoldText(color: Colors.white60, size: 30),
                  children: [
                    TextSpan(
                        text:
                            '/${questionController.currentLevel.riddles.length}',
                        style: normalText(color: Colors.white60, size: 22))
                  ])),
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: questionController.updateTheQnNum,
              controller: pageController,
              itemCount: questionController.levels.length,
              itemBuilder: (context, index) => QuestionCard(
                  // question: questionController.question
                  question: questionController.currentLevel.riddles[index]),
            )),
          ],
        ),
      ),
    );
  }
}
