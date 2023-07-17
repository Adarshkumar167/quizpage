class Question {
  final int id;
  final String question;
  final List<String> options;
  final String correctAnswer;
  bool isBookmarked;
  String selectedAnswer;

  Question({
    required this.id,
    required this.question,
    required this.options,
    required this.correctAnswer,
    this.isBookmarked = false,
    this.selectedAnswer = '',
  });

  get selectedOption => null;
}
