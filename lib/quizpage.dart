// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:quizpage/data/questions.dart';
import 'package:quizpage/optionsbutton.dart';
import 'package:quizpage/other/submit_page.dart';
import 'package:quizpage/other/submit_page2.dart';
import 'package:quizpage/submit.dart';
import 'package:quizpage/timer.dart';

class QuizPage extends StatefulWidget {
  final List chapters;
  const QuizPage({
    Key? key,
    required this.chapters,
  }) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int selectedNumber = 1;
  List questions = [];
  int score = 0;
  int left = 0;
  int wrong = 0;
  late List<int> selectedOptionIndexes;

  @override
  void initState() {
    addDataToQuestions();
    super.initState();
  }

  void addDataToQuestions() {
    int id = 1;
    for (var element in widget.chapters) {
      questions.add(Question(
          id: id,
          question: element['Question'],
          options: [
            element['Option 1'].toString(),
            element['Option 2'].toString(),
            element['Option 3'].toString(),
            element['Option 4'].toString()
          ],
          correctAnswer: element['Answer'].toString()));
      id++;

    }
    selectedOptionIndexes = List<int>.filled(questions.length, -1);

  }

  void calculateScore() {
    score = 0;
    left = 0;
    wrong = 0;
    for (int i = 0; i < selectedOptionIndexes.length; i++) {
      if (selectedOptionIndexes[i] != -1 &&
          questions[i].options[selectedOptionIndexes[i]] ==
              questions[i].correctAnswer) {
        score++;
      }
      if (selectedOptionIndexes[i] == -1) left++;
      if (selectedOptionIndexes[i] != -1 &&
          questions[i].options[selectedOptionIndexes[i]] !=
              questions[i].correctAnswer) {
        wrong++;
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
            double correctness = (score / questions.length) * 100;
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
                        Navigator.pop(context);
                        if (correctness < 40) {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SummaryPage2(
                                chapters: widget.chapters,
                                marks: score,
                                skipped: left,
                                incorrect: wrong,
                                questions: questions.length,
                              ),
                            ),
                          );
                        } else {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SummaryPage(
                                marks: score,
                                skipped: left,
                                incorrect: wrong,
                                questions: questions.length,
                              ),
                            ),
                          );
                        }
                      },
                      child: const Text('Yes'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('No'),
                    ),
                  ],
                );
              },
            );
          })
        ],
      ),
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
                    if (selectedNumber == number) {
                      isSelected = true;
                    }
                    BoxDecoration decoration;
                    Widget child;

                    bool isMarked =
                        isSelected && selectedOptionIndexes[number - 1] != -1;
                    if (isMarked) {
                      decoration = BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color.fromRGBO(73, 229, 234, 1.0),
                        ),
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
                    } else if (selectedOptionIndexes[number - 1] != -1) {
                      decoration = BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color.fromRGBO(73, 229, 234, 1.0),
                        ),
                      );
                      child = const Icon(
                        Icons.check,
                        color: Color.fromRGBO(73, 229, 234, 1.0),
                        size: 16,
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
                  children: [
                    Text(
                      '${questions[selectedNumber - 1].id}.',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
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
                mainAxisAlignment: (selectedNumber == 1)
                    ? MainAxisAlignment.end // Align to the right
                    : MainAxisAlignment.start,
                children: [
                  if (selectedNumber >
                      1) // Show the first GestureDetector only if selectedNumber > 1
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.26),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedNumber--;
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: MediaQuery.of(context).size.width * 0.15,
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
                    ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.08),
                  if (selectedNumber < questions.length)
                    // Show the second GestureDetector only if selectedNumber < questions.length
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.26),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (selectedOptionIndexes[selectedNumber] != -1) {
                              selectedNumber++;
                            } else {
                              selectedNumber++;
                              selectedOptionIndexes[selectedNumber - 1] = -1;
                            }
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: MediaQuery.of(context).size.width * 0.15,
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
