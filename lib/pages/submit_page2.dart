import 'package:flutter/material.dart';

import 'package:quizpage/pages/quizpage.dart';

class SummaryPage2 extends StatefulWidget {
  final int marks;
  final int skipped;
  final int incorrect;
  final int questions;
  final List chapters;
  const SummaryPage2({
    Key? key,
    required this.marks,
    required this.skipped,
    required this.incorrect,
    required this.questions,
    required this.chapters,
  }) : super(key: key);

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
                            'Oops!',
                            style: TextStyle(
                              fontSize: 30,
                              color: Color.fromRGBO(234, 73, 73, 1.0),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 5,
                        width: 50,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(87, 87, 87, 0.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        'Better Luck Next Time',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Please make sure that you filled out and try again.',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.3),
              SizedBox(
                width: 0.8 * MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuizPage(
                          chapters: widget.chapters,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(255, 94, 94, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: const Text(
                    'TRY AGAIN',
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
