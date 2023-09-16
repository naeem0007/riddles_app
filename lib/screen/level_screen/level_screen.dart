import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riddles_app/constant/constant.dart';
import 'package:riddles_app/controller/question_controller.dart';
import 'package:riddles_app/screen/riddles_screen/riddles_screen.dart';

class LevelScreen extends StatelessWidget {
  const LevelScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    QuestionController controller = Get.put(QuestionController());

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            'Levels',
            style: boldText(color: Colors.white, size: 25),
          )),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                  child: Container(
                color: bgcolor,
              )),
              Expanded(
                flex: 3,
                child: GridView.builder(
                    itemCount: 2,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5),
                    itemBuilder: (context, index) {
                      // final level = levelController.levels[index];
                      final level = controller.levels[index];
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: InkWell(
                          onTap: () {
                            // Set the current level in the controller
                            controller.reset();
                            controller.setCurrentLevel(level);

                            // Navigate to the riddles screen for the selected level
                            Get.to(() => const RiddlesScreen());
                          },
                          child: Container(
                            decoration: BoxDecoration(color: Colors.grey[800]),
                            child: Center(
                              child: Text(
                                level.id.toString(),
                                style:
                                    normalText(color: Colors.white, size: 18),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Expanded(
                  child: Container(
                color: bgcolor,
              )),
            ],
          )),
    );
  }
}
