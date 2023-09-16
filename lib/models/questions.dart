class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question(
      {required this.id,
      required this.question,
      required this.answer,
      required this.options});
}

const List riddlesList = [
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
  {
    "id": 4,
    "question": "I'm tall when I'm young and short when I'm old. What am I?",
    "options": ["A tree", "A giraffe", "A human", "A candle"],
    "answer_index": 3
  },
];
