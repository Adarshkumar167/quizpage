import 'package:flutter/material.dart';
import 'package:quizpage/optionsbutton.dart';
import 'package:quizpage/other/submit_page.dart';
import 'package:quizpage/submit.dart';
import 'package:quizpage/timer.dart';
import 'package:quizpage/questions.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  var selectedNumber = 1;
  List<int> selectedOptionIndexes = List<int>.filled(questions.length, -1);
  int score = 0;

  void calculateScore() {
    score = 0;
    for (int i = 0; i < selectedOptionIndexes.length; i++) {
      if (selectedOptionIndexes[i] != -1 &&
          questions[i].options[selectedOptionIndexes[i]] ==
              questions[i].correctAnswer) {
        score++;
      }
    }
  }

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
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.pause_circle_filled_rounded,
                color: Color.fromRGBO(196, 196, 196, 1),
              ),
              SizedBox(width: 8),
              Time(),
            ],
          ),
          actions: [
            SizedBox(width: MediaQuery.of(context).size.width * 0.1),
            MyWidget(onTap: () {
              calculateScore();
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text(
                      'Are you sure you want to submit?',
                      style: TextStyle(fontSize: 16),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Close the dialog
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SummaryPage(marks: score),
                            ),
                          );
                        },
                        child: const Text('Yes'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Close the dialog
                        },
                        child: const Text('No'),
                      ),
                    ],
                  );
                },
              );
            })
          ]),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                          questions[selectedNumber - 1].isBookmarked =
                              !questions[selectedNumber - 1].isBookmarked;
                        });
                      },
                      child: Icon(
                        questions[selectedNumber - 1].isBookmarked
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
                    onPressed: (option) {
                      setState(() {
                        selectedOptionIndexes[selectedNumber - 1] = 0;
                      });
                    },
                    isCorrect: questions[selectedNumber - 1].options[0] ==
                        questions[selectedNumber - 1].correctAnswer,
                    isSelected: selectedOptionIndexes[selectedNumber - 1] == 0,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  CustomOutlinedButton(
                    text: 'B. ${questions[selectedNumber - 1].options[1]}',
                    onPressed: (option) {
                      setState(() {
                        selectedOptionIndexes[selectedNumber - 1] = 1;
                      });
                    },
                    isCorrect: questions[selectedNumber - 1].options[1] ==
                        questions[selectedNumber - 1].correctAnswer,
                    isSelected: selectedOptionIndexes[selectedNumber - 1] == 1,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  CustomOutlinedButton(
                    text: 'C. ${questions[selectedNumber - 1].options[2]}',
                    onPressed: (option) {
                      setState(() {
                        selectedOptionIndexes[selectedNumber - 1] = 2;
                      });
                    },
                    isCorrect: questions[selectedNumber - 1].options[2] ==
                        questions[selectedNumber - 1].correctAnswer,
                    isSelected: selectedOptionIndexes[selectedNumber - 1] == 2,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  CustomOutlinedButton(
                    text: 'D. ${questions[selectedNumber - 1].options[3]}',
                    onPressed: (option) {
                      setState(() {
                        selectedOptionIndexes[selectedNumber - 1] = 3;
                      });
                    },
                    isCorrect: questions[selectedNumber - 1].options[3] ==
                        questions[selectedNumber - 1].correctAnswer,
                    isSelected: selectedOptionIndexes[selectedNumber - 1] == 3,
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (selectedNumber > 1) {
                        setState(() {
                          selectedNumber--;
                        });
                      }
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
                      if (selectedOptionIndexes[selectedNumber - 1] != -1) {
                        setState(() {
                          if (selectedNumber < questions.length) {
                            selectedOptionIndexes[selectedNumber] =
                                selectedOptionIndexes[selectedNumber - 1];
                            selectedNumber++;
                            selectedOptionIndexes[selectedNumber - 1] = -1;
                          }
                        });
                      }
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.07),
            ],
          ),
        ),
      ),
    );
  }
}
