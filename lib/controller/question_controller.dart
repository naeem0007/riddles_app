import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riddles_app/constant/constant.dart';
import 'package:riddles_app/models/levels/levels.dart';
import 'package:riddles_app/models/questions.dart';
import 'package:riddles_app/screen/score_screen/score_sheet.dart';

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //ProgressBar Animation

  late AnimationController _animationController;
  late Animation _animation;
  Animation get animation => _animation;

  List<PageController> _pageControllers = [];

  final List<Level> _levels = levelsData
      .map((level) => Level(
            id: level['id'],
            riddles:
                List<Question>.from(level['riddles'].map((riddle) => Question(
                      id: riddle['id'],
                      question: riddle['question'],
                      answer: riddle['answer_index'],
                      options: List<String>.from(riddle['options']),
                    ))),
          ))
      .toList();
  List<Level> get levels => _levels;

  late bool _isAnswered = false;
  bool get isAnswered => _isAnswered;

  late int _correctAnswer;
  int get correctAnswer => _correctAnswer;

  late int _selectedAnswer;
  int get selectedAnswer => _selectedAnswer;

  late final RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => _questionNumber;

  late int _numberOfCorrectAns = 0;
  int get numberOfCorrectAns => _numberOfCorrectAns;

  Level? _currentLevel;
  Level get currentLevel =>
      _currentLevel!; // Add a field to store the current level

  List<Question>?
      _currentLevelRiddles; // Add a field to store the riddles for the current level
  List<Question> get currentLevelRiddles => _currentLevelRiddles!;

  void setCurrentLevel(Level level) {
    _currentLevel = level;
    _currentLevelRiddles = level.riddles;
    _questionNumber.value = 1; // Reset the question number
  }

  @override
  void onInit() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 60));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        update();
      });
    // _animationController.forward().whenComplete(nextQuestion);
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        nextQuestion();
      }
    });
    _animationController.forward();

    _pageControllers = List.generate(
      _levels.length,
      (index) => PageController(
        initialPage: 0,
      ),
    );

    super.onInit();
  }

  PageController getPageControllerForLevel(int levelId) {
    return _pageControllers[levelId - 1];
  }

  @override
  void onClose() {
    _animationController.dispose();
    for (var controller in _pageControllers) {
      controller.dispose();
    }

    super.onClose();
  }

  void checkAnswer(Question question, int selectedIndex) {
    //once user press any option then it will run
    if (!_isAnswered) {
      // Check if the selected answer index is valid
      if (selectedIndex >= 0 && selectedIndex < question.options.length) {
        _isAnswered = true;
        _correctAnswer = question.answer;
        _selectedAnswer = selectedIndex;

        if (_correctAnswer == _selectedAnswer) _numberOfCorrectAns++;

        // Stop the counter
        _animationController.stop();
        update();
        Future.delayed(const Duration(seconds: 1), () {
          nextQuestion();
        });
      }
    }
  }

  void nextQuestion() {
    if (_questionNumber.value != _currentLevel!.riddles.length) {
      _questionNumber.value++;
      _isAnswered = false;
      // final pageController = getPageController();
      final pageController = getPageControllerForLevel(_currentLevel!.id);

      pageController.nextPage(
        duration: const Duration(milliseconds: 250),
        curve: Curves.ease,
      );

      _animationController.reset();
      _animationController.forward();
    } else {
      scoreSheet();

      // Display the score in a BottomSheet

      //   // Example: Navigate back to levels screen
      // }
      // else {
      //   Get.to(() => const ScoreScreen());
      // }
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }

  void reset() {
    // Reset the question number
    _questionNumber.value = 1;

    // Reset the number of correct answers
    _numberOfCorrectAns = 0;

    // Reset the animation controller
    _animationController.reset();

    // Restart the animation
    _animationController.forward();

    // Clear the selected answer
    _selectedAnswer = -1;

    // Mark the question as unanswered
    _isAnswered = false;
  }
}
