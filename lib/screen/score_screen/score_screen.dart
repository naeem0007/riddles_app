import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riddles_app/constant/constant.dart';
import 'package:riddles_app/screen/level_screen/level_screen.dart';
import 'package:riddles_app/screen/riddles_screen/riddles_screen.dart';
import '../../controller/question_controller.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionController qncontroller = Get.put(QuestionController());
    int totalQuestions = qncontroller.currentLevel.riddles.length;
    int correctAnswers = qncontroller.numberOfCorrectAns;
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Spacer(
            flex: 2,
          ),
          Text(
            'Congratulations!',
            style: semiBoldText(color: Colors.red, size: 25),
          ),
          const Spacer(),
          Text(
            'Your Score',
            style: semiBoldText(color: Colors.white, size: 25),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            '${correctAnswers * 10} / ${totalQuestions * 10}',
            style: semiBoldText(color: Colors.white, size: 25),
          ),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton(
              onPressed: () {
                qncontroller.reset();
                Get.to(() => const LevelScreen());
              },
              child: Text(
                'Try Again',
                style: normalText(color: Colors.white),
              )),
          const Spacer(
            flex: 2,
          ),
        ]),
      ),
    );
  }
}
