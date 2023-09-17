import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riddles_app/constant/constant.dart';
import 'package:riddles_app/controller/question_controller.dart';

void scoreSheet() {
  QuestionController questionController = Get.put(QuestionController());
  int totalQuestions = questionController.currentLevel.riddles.length;
  int correctAnswers = questionController.numberOfCorrectAns;
  Get.bottomSheet(
    BottomSheet(
      elevation: 5,
      onClosing: () {
        questionController.reset();
        Get.back();
      },
      builder: (context) => Container(
        height: 200,
        decoration: const BoxDecoration(
            gradient: primaryGradient,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your Score is ${correctAnswers * 10} / ${totalQuestions * 10}!',
                style: normalText(size: 25),
              ),
              const SizedBox(
                height: 12,
              ),
              ElevatedButton(
                  onPressed: () {
                    questionController.reset();
                    Get.back();
                    Get.back();
                  },
                  child: Text(
                    'Close',
                    style: normalText(size: 18, color: Colors.black),
                  ))
            ],
          ),
        ),
      ),
    ),
  );
}
