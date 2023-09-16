import 'package:riddles_app/models/questions.dart';

class Level {
  final int id;
  final List<Question> riddles; // List of riddles for this level

  Level({required this.id, required this.riddles});
}

// Create a list of levels with their respective riddles

const List level1 = [
  {
    "id": 1,
    "question":
        "I have keys but open no locks. I have space but no room. You can enter, but you can't go inside. What am I?",
    "options": ["A keyboard", "A book", "A tree", "A phone"],
    "answer_index": 0
  },
  {
    "id": 2,
    "question":
        "I am taken from a mine, and shut up in a wooden case, from which I am never released, and yet I am used by almost every person. What am I?",
    "options": ["Gold", "Diamond", "Coal", "Pencil lead"],
    "answer_index": 3
  },
  {
    "id": 3,
    "question": "What has keys but can't open locks?",
    "options": ["A treasure chest", "A keyboard", "A door", "A book"],
    "answer_index": 1
  },
];

const List level2 = [
  {
    "id": 1,
    "question":
        "I have keys but open no locks. I have space but no room. You can enter, but you can't go inside. What am I?",
    "options": ["A keyboard", "A book", "A tree", "A phone"],
    "answer_index": 0
  },
  {
    "id": 2,
    "question":
        "I am taken from a mine, and shut up in a wooden case, from which I am never released, and yet I am used by almost every person. What am I?",
    "options": ["Gold", "Diamond", "Coal", "Pencil lead"],
    "answer_index": 3
  },
  {
    "id": 3,
    "question": "What has keys but can't open locks?",
    "options": ["A treasure chest", "A keyboard", "A door", "A book"],
    "answer_index": 1
  },
];
const List level3 = [
  {
    "id": 1,
    "question":
        "I have keys but open no locks. I have space but no room. You can enter, but you can't go inside. What am I?",
    "options": ["A keyboard", "A book", "A tree", "A phone"],
    "answer_index": 0
  },
  {
    "id": 2,
    "question":
        "I am taken from a mine, and shut up in a wooden case, from which I am never released, and yet I am used by almost every person. What am I?",
    "options": ["Gold", "Diamond", "Coal", "Pencil lead"],
    "answer_index": 3
  },
  {
    "id": 3,
    "question": "What has keys but can't open locks?",
    "options": ["A treasure chest", "A keyboard", "A door", "A book"],
    "answer_index": 1
  },
];
const List level4 = [
  {
    "id": 1,
    "question":
        "I have keys but open no locks. I have space but no room. You can enter, but you can't go inside. What am I?",
    "options": ["A keyboard", "A book", "A tree", "A phone"],
    "answer_index": 0
  },
  {
    "id": 2,
    "question":
        "I am taken from a mine, and shut up in a wooden case, from which I am never released, and yet I am used by almost every person. What am I?",
    "options": ["Gold", "Diamond", "Coal", "Pencil lead"],
    "answer_index": 3
  },
  {
    "id": 3,
    "question": "What has keys but can't open locks?",
    "options": ["A treasure chest", "A keyboard", "A door", "A book"],
    "answer_index": 1
  },
];
