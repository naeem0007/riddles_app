import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riddles_app/constant/constant.dart';
import 'package:riddles_app/screen/riddles_screen/riddles_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(
                flex: 2,
              ),
              Text("Let's Play Riddles!",
                  style: boldText(size: 35, color: Colors.white)),
              Text("Enter your Name Below",
                  style: normalText(size: 18, color: Colors.white)),
              const Spacer(),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Your Name',
                    hintStyle: normalText(),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12))),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  if (nameController.text.isNotEmpty) {
                    Get.to(() => const RiddlesScreen());
                    nameController.clear();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        'Please Enter Your Name',
                        style: semiBoldText(color: Colors.black, size: 15),
                      ),
                      backgroundColor: Colors.tealAccent,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12))),
                    ));
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: primaryGradient,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "Let's Start",
                    style: semiBoldText(size: 20),
                  ),
                ),
              ),
              const Spacer(
                flex: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
