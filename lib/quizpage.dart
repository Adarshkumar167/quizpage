import 'package:flutter/material.dart';
import 'package:quizpage/optionsbutton.dart';
import 'package:quizpage/submit.dart';
import 'package:quizpage/timer.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class Question {
  final int id;
  final String question;
  final List<String> options;
  final String correctAnswer;

  Question({
    required this.id,
    required this.question,
    required this.options,
    required this.correctAnswer,
  });
}

class _QuizPageState extends State<QuizPage> {
  var selectedNumber = 1;
  bool _isBookmarked = false;

  final List<Question> questions = [
    Question(
      id: 1,
      question:
          'Which of the following is the fastest means of transportation?',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.keyboard_backspace_rounded),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Icon(
              Icons.pause_circle_filled_rounded,
              color: Color.fromRGBO(196, 196, 196, 1),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.01),
            const Time(),
          ],
        ),
        actions: [
          SizedBox(width: MediaQuery.of(context).size.width * 0.1),
          const MyWidget(),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: questions.length,
                  itemBuilder: (context, index) {
                    final question = questions[index];
                    final number = question.id;
                    bool isSelected = false;
                    bool isPreviousSelected = false;
                    if (selectedNumber == number) {
                      isSelected = true;
                    } else if (selectedNumber > number) {
                      isPreviousSelected = true;
                    }
                    BoxDecoration decoration;
                    Widget child;
                    if (isPreviousSelected) {
                      decoration = BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: const Color.fromRGBO(73, 229, 234, 1.0)),
                      );
                      child = const Icon(
                        Icons.check,
                        color: Color.fromRGBO(73, 229, 234, 1.0),
                        size: 16,
                      );
                    } else if (isSelected) {
                      decoration = const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(73, 229, 234, 1.0),
                      );
                      child = Text(
                        '$number',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    } else {
                      decoration = const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      );
                      child = Text(
                        '$number',
                        style: const TextStyle(
                          color: Color.fromRGBO(73, 229, 234, 1.0),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        width: 30,
                        alignment: Alignment.center,
                        decoration: decoration,
                        child: child,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${questions[selectedNumber - 1].id}.',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isBookmarked = !_isBookmarked;
                        });
                      },
                      child: Icon(
                        _isBookmarked
                            ? Icons.bookmark
                            : Icons.bookmark_border_outlined,
                        color: const Color.fromRGBO(73, 229, 234, 1.0),
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                questions[selectedNumber - 1].question,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomOutlinedButton(
                    text: 'A. ${questions[selectedNumber - 1].options[0]}',
                    onPressed: () {
                      setState(() {
                        // Check if the selected answer is correct
                        bool isCorrect =
                            questions[selectedNumber - 1].options[0] ==
                                questions[selectedNumber - 1].correctAnswer;

                        // Handle button press here
                      });
                    },
                    isCorrect: questions[selectedNumber - 1].options[0] ==
                        questions[selectedNumber - 1].correctAnswer,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  CustomOutlinedButton(
                    text: 'B. ${questions[selectedNumber - 1].options[1]}',
                    onPressed: () {
                      setState(() {
                        // Check if the selected answer is correct
                        bool isCorrect =
                            questions[selectedNumber - 1].options[1] ==
                                questions[selectedNumber - 1].correctAnswer;

                        // Handle button press here
                      });
                    },
                    isCorrect: questions[selectedNumber - 1].options[1] ==
                        questions[selectedNumber - 1].correctAnswer,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  CustomOutlinedButton(
                    text: 'C. ${questions[selectedNumber - 1].options[2]}',
                    onPressed: () {
                      setState(() {
                        // Check if the selected answer is correct
                        bool isCorrect =
                            questions[selectedNumber - 1].options[2] ==
                                questions[selectedNumber - 1].correctAnswer;

                        // Handle button press here
                      });
                    },
                    isCorrect: questions[selectedNumber - 1].options[2] ==
                        questions[selectedNumber - 1].correctAnswer,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  CustomOutlinedButton(
                    text: 'D. ${questions[selectedNumber - 1].options[3]}',
                    onPressed: () {
                      setState(() {
                        // Check if the selected answer is correct
                        bool isCorrect =
                            questions[selectedNumber - 1].options[3] ==
                                questions[selectedNumber - 1].correctAnswer;

                        // Handle button press here
                      });
                    },
                    isCorrect: questions[selectedNumber - 1].options[3] ==
                        questions[selectedNumber - 1].correctAnswer,
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (selectedNumber > 1) {
                          selectedNumber--;
                        }
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.height * 0.07,
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color.fromRGBO(196, 196, 196, 1),
                          width: 1.0,
                        ),
                      ),
                      child: const Icon(
                        Icons.keyboard_backspace,
                        color: Color.fromRGBO(196, 196, 196, 1),
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.07),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (selectedNumber < questions.length) {
                          selectedNumber++;
                        }
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.height * 0.07,
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color.fromRGBO(73, 229, 234, 1.0),
                          width: 1.0,
                        ),
                      ),
                      child: Transform.rotate(
                        angle: 3.14,
                        child: const Icon(
                          Icons.keyboard_backspace,
                          color: Color.fromRGBO(73, 229, 234, 1.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
