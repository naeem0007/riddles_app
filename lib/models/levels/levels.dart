import 'package:riddles_app/models/questions.dart';

class Level {
  final int id;
  final List<Question> riddles; // List of riddles for this level

  Level({required this.id, required this.riddles});
}

const List<Map<String, dynamic>> levelsData = [
  {
    "id": 1,
    "riddles": [
      {
        "id": 1,
        "question": "Riddle 1 for Level 1",
        "answer_index": 0,
        "options": ["Option A", "Option B", "Option C", "Option D"],
      },
      {
        "id": 2,
        "question": "Riddle 2 for Level 1",
        "answer_index": 1,
        "options": ["Option A", "Option B", "Option C", "Option D"],
      },
      // Add more riddles for Level 1
    ],
  },
  {
    "id": 2,
    "riddles": [
      {
        "id": 1,
        "question": "Riddle 1 for Level 2",
        "answer_index": 2,
        "options": ["Option A", "Option B", "Option C", "Option D"],
      },
      {
        "id": 2,
        "question": "Riddle 2 for Level 2",
        "answer_index": 3,
        "options": ["Option A", "Option B", "Option C", "Option D"],
      },
      // Add more riddles for Level 2
    ],
  },
  // Add levels and their riddles up to Level 10
];
