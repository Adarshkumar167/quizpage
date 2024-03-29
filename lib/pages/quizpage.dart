import 'package:flutter/material.dart';
import 'package:quizpage/data/questions.dart';
import 'package:quizpage/widgets/optionsbutton.dart';
import 'package:quizpage/pages/submit_page.dart';
import 'package:quizpage/pages/submit_page2.dart';
import 'package:quizpage/widgets/submit.dart';
import 'package:quizpage/widgets/timer.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int selectedNumber = 1;
  List<int> selectedOptionIndexes = List<int>.filled(questions.length, -1);

  int score = 0;
  int left = 0;
  int wrong = 0;
  bool isTappedButton1 = false;
  bool isTappedButton2 = false;

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

  void handleTimerExpired() {
    calculateScore();
    double correctness = (score / questions.length) * 100;

    if (correctness < 40) {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SummaryPage2(),
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
            selectedOptionIndex: selectedOptionIndexes,
          ),
        ),
      );
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Icon(
              Icons.pause_circle_filled_rounded,
              color: Color.fromRGBO(196, 196, 196, 1),
            ),
            const SizedBox(width: 8),
            Time(onTimerExpired: handleTimerExpired),
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
                              builder: (context) => const SummaryPage2(),
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
                                selectedOptionIndex: selectedOptionIndexes,
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
                          color: const Color.fromRGBO(96, 188, 250, 1.0),
                        ),
                      );
                      child = const Icon(
                        Icons.check,
                        color: Color.fromRGBO(96, 188, 250, 1.0),
                        size: 16,
                      );
                    } else if (isSelected) {
                      decoration = const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(96, 188, 250, 1.0),
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
                          color: const Color.fromRGBO(96, 188, 250, 1.0),
                        ),
                      );
                      child = const Icon(
                        Icons.check,
                        color: Color.fromRGBO(96, 188, 250, 1.0),
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
                          color: Color.fromRGBO(96, 188, 250, 1.0),
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
                          selectedOptionIndexes[selectedNumber - 1] = -1;
                        });
                      },
                      child: const Text('CLEAR'),
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
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: questions[selectedNumber - 1].options.length,
                  itemBuilder: (context, index) => CustomOutlinedButton(
                    text: questions[selectedNumber - 1].options[index],
                    onPressed: (option) {
                      setState(() {
                        selectedOptionIndexes[selectedNumber - 1] = index;
                      });
                    },
                    isCorrect: questions[selectedNumber - 1].options[index] ==
                        questions[selectedNumber - 1].correctAnswer,
                    isSelected:
                        selectedOptionIndexes[selectedNumber - 1] == index,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Row(
                mainAxisAlignment: (selectedNumber == 1)
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  if (selectedNumber > 1)
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.26),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isTappedButton1 = true;
                            isTappedButton2 = false;
                            selectedNumber--;
                          });
                          Future.delayed(const Duration(milliseconds: 200), () {
                            setState(() {
                              isTappedButton1 = false;
                            });
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: MediaQuery.of(context).size.width * 0.15,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isTappedButton1
                                  ? Colors.white
                                  : const Color.fromRGBO(96, 188, 250, 1.0),
                              width: 1.0,
                            ),
                            color: isTappedButton1
                                ? const Color.fromRGBO(96, 188, 250, 1.0)
                                : Colors.white,
                          ),
                          child: Icon(
                            Icons.keyboard_backspace,
                            color: isTappedButton1
                                ? Colors.white
                                : const Color.fromRGBO(96, 188, 250, 1.0),
                          ),
                        ),
                      ),
                    ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.08),
                  if (selectedNumber < questions.length)
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.26),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isTappedButton1 = false;
                            isTappedButton2 = true;
                            if (selectedOptionIndexes[selectedNumber] != -1) {
                              selectedNumber++;
                            } else {
                              selectedNumber++;
                              selectedOptionIndexes[selectedNumber - 1] = -1;
                            }
                          });
                          Future.delayed(const Duration(milliseconds: 200), () {
                            setState(() {
                              isTappedButton2 = false;
                            });
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: MediaQuery.of(context).size.width * 0.15,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isTappedButton2
                                  ? Colors.white
                                  : const Color.fromRGBO(96, 188, 250, 1.0),
                              width: 1.0,
                            ),
                            color: isTappedButton2
                                ? const Color.fromRGBO(96, 188, 250, 1.0)
                                : Colors.white,
                          ),
                          child: Transform.rotate(
                            angle: 3.14,
                            child: Icon(
                              Icons.keyboard_backspace,
                              color: isTappedButton2
                                  ? Colors.white
                                  : const Color.fromRGBO(96, 188, 250, 1.0),
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
