import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riddles_app/constant/constant.dart';
import 'package:riddles_app/controller/question_controller.dart';
import 'package:riddles_app/models/levels/levels.dart';
import 'package:riddles_app/models/questions.dart';
import 'package:riddles_app/screen/components/options.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    super.key,
    required this.question,
  });

  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionController controller = Get.put(QuestionController());
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Text(
            // question.question,
            question.question,

            style: semiBoldText(size: 18),
          ),
          const SizedBox(
            height: 10,
          ),
          ...List.generate(
              question.options.length,
              (index) => Options(
                  text: question.options[index],
                  index: index,
                  press: () {
                    controller.checkAnswer(question, index);
                  }))
        ],
      ),
    );
  }
}
