import 'package:flutter/material.dart';
import 'package:quizpage/quizpage.dart';

class SummaryPage2 extends StatefulWidget {
  final int marks;
  final int skipped;
  final int incorrect;
  final int questions;

  const SummaryPage2(
      {super.key,
      required this.marks,
      required this.skipped,
      required this.incorrect,
      required this.questions});

  @override
  State<SummaryPage2> createState() => _SummaryPage2State();
}

class _SummaryPage2State extends State<SummaryPage2>
    with TickerProviderStateMixin {
  int total(int marks) {
    double correctness = ((marks / widget.questions) * 100);
    if (correctness < 40) {
      return 3;
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
        centerTitle: true,
        title: const Text(
          'Better Luck Next Time',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                width: 0.8 * MediaQuery.of(context).size.width,
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/image/summary_page/better_luck.png',
                            width: MediaQuery.of(context).size.width * 0.5,
                          ),
                          const Text(
                            'Better Luck Next Time',
                            style: TextStyle(
                              fontSize: 30,
                              color: Color.fromRGBO(62, 73, 79, 1),
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  offset: Offset(2, 2),
                                  blurRadius: 3,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        'We have completed Quiz successfully',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: 'You attempt ',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text:
                                    '${widget.marks + widget.incorrect} questions',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              const TextSpan(
                                text: ' and from that ',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: '${widget.marks}',
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                              const TextSpan(
                                text: ' answers',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const TextSpan(
                                text: ' is correct',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Completion',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color.fromRGBO(151, 152, 159, 1),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '${(((widget.marks + widget.incorrect) / widget.questions) * 100).toStringAsFixed(0)}%',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Correct Answer',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color.fromRGBO(151, 152, 159, 1),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '${widget.marks} questions',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Skipped',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color.fromRGBO(151, 152, 159, 1),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '${widget.skipped}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Incorrect Answer',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color.fromRGBO(151, 152, 159, 1),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '${widget.incorrect}',
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 0.8 * MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const QuizPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(90, 216, 224, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: const Text(
                    'RETRY',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
