import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riddles_app/constant/constant.dart';

import 'package:riddles_app/controller/question_controller.dart';

import 'package:riddles_app/screen/components/body.dart';

class RiddlesScreen extends StatefulWidget {
  const RiddlesScreen({super.key});

  @override
  State<RiddlesScreen> createState() => _HomePageState();
}

class _HomePageState extends State<RiddlesScreen> {
  @override
  Widget build(BuildContext context) {
    QuestionController controller = Get.put(QuestionController());

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        title: Text(
          'Riddles for Level ${controller.currentLevel.id}',
          style: normalText(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: controller.nextQuestion,
              child: Text(
                'Skip',
                style: normalText(color: Colors.white),
              ))
        ],
      ),
      body: const Body(),
    );
  }
}
