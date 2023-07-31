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

final List<Question> questions = [
  Question(
    id: 1,
    question: 'Which of the following is the fastest means of transportation?',
    options: ['Roadways', 'Airways', 'Waterways', 'Railways'],
    correctAnswer: 'Airways',
  ),
  Question(
    id: 2,
    question: 'Which is the tallest building on the Earth?',
    options: [
      'Burj Khalifa',
      'Shanghai Tower',
      'Merdeka',
      'Lotte World Tower',
    ],
    correctAnswer: 'Burj Khalifa',
  ),
  Question(
    id: 3,
    question: 'Which is the largest country by area?',
    options: ['Canada', 'Russia', 'China', 'India'],
    correctAnswer: 'Russia',
  ),
  Question(
    id: 4,
    question: 'What Does the Heart Pump?',
    options: ['Water', 'Saliva', 'Blood', 'Oxygen'],
    correctAnswer: 'Blood',
  ),
  Question(
    id: 5,
    question: 'In which country is the Eiffel Tower located?',
    options: ['France', 'UAE', 'Rome', 'Mexico'],
    correctAnswer: 'France',
  ),
  Question(
    id: 6,
    question: 'Who Invented the Light Bulb?',
    options: [
      'Michael Faraday',
      'Charles Babbage',
      'Taylor Swift',
      'Thomas Alva Edison',
    ],
    correctAnswer: 'Thomas Alva Edison',
  ),
  Question(
    id: 7,
    question: 'Who discovered zero?',
    options: ['Aryabhatt', 'Vedvyas', 'Maharshi Panini', 'None of these'],
    correctAnswer: 'Aryabhatt',
  ),
  Question(
    id: 8,
    question: '10×10+5 is equal to?',
    options: ['25', '150', '105', '125'],
    correctAnswer: '105',
  ),
  Question(
    id: 9,
    question: 'What is the face value of 8 in 48123?',
    options: ['8', '80', '800', '8000'],
    correctAnswer: '8',
  ),
  Question(
    id: 10,
    question: 'What is the place value of 8 in 48123?',
    options: ['8', '80', '800', '8000'],
    correctAnswer: '8000',
  ),
];
