import 'package:flutter/material.dart';
import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:quizpage/pages/review.dart';

import 'package:quizpage/pages/start.dart';

class SummaryPage extends StatefulWidget {
  final int marks;
  final int skipped;
  final int incorrect;
  final int questions;
  final List<int> selectedOptionIndex;

  const SummaryPage(
      {super.key,
      required this.marks,
      required this.skipped,
      required this.incorrect,
      required this.questions,
      required this.selectedOptionIndex});

  @override
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage>
    with TickerProviderStateMixin {
  late ConfettiController _controller;
  @override
  void initState() {
    super.initState();
    _controller = ConfettiController(duration: const Duration(seconds: 3));
    _startConfetti();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int total(int marks) {
    double correctness = ((marks / widget.questions) * 100);

    if (correctness >= 80 && correctness <= 100) {
      return 1;
    } else if (correctness >= 60 && correctness <= 79.999999) {
      return 2;
    } else if (correctness >= 40 && correctness <= 59.999999) {
      return 3;
    } else {
      return 0;
    }
  }

  String getMedalName(int total) {
    switch (total) {
      case 1:
        return 'Gold Medal';
      case 2:
        return 'Silver Medal';
      case 3:
        return 'Bronze Medal';
      default:
        return '';
    }
  }

  Color getContainerColor(int total) {
    switch (total) {
      case 1:
        return const Color.fromRGBO(255, 203, 32, 1);
      case 2:
        return const Color.fromRGBO(140, 149, 164, 1);
      case 3:
        return const Color.fromRGBO(187, 134, 71, 1);
      default:
        return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    int totals = total(widget.marks);
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Scaffold(
          backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
            centerTitle: true,
            title: const Text(
              'Congratulations',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: Icon(Icons.share_outlined),
                ),
              )
            ],
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
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image.asset(
                                    'assets/image/summary_page/medal_$totals.png',
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                  ),
                                  Transform.translate(
                                    offset: const Offset(-90, -65),
                                    child: Image.asset(
                                      'assets/image/summary_page/star1.png',
                                      width: 70,
                                    ),
                                  ),
                                  Transform.translate(
                                    offset: const Offset(100, 35),
                                    child: Image.asset(
                                      'assets/image/summary_page/star2.png',
                                      width: 90,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                getMedalName(totals),
                                style: const TextStyle(
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
                              const SizedBox(height: 10),
                              Container(
                                height: 5,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: getContainerColor(totals),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              const SizedBox(height: 30),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Share with us: ',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Image.asset(
                                'assets/image/summary_page/facebook.png',
                                scale: 4,
                              ),
                              const SizedBox(width: 10),
                              Image.asset(
                                'assets/image/summary_page/whatsapp.png',
                                scale: 4,
                              ),
                            ],
                          ),
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
                          MaterialPageRoute(
                              builder: (context) => const StartPage()),
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
                        'DONE',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 0.8 * MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReviewPage(
                                    selectedOptionIndexes:
                                        widget.selectedOptionIndex,
                                  )),
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
                        'REVIEW',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
        ConfettiWidget(
          confettiController: _controller,
          blastDirection: pi / 2,
          emissionFrequency: 0.05,
          maxBlastForce: 5,
          minBlastForce: 2,
          blastDirectionality: BlastDirectionality.explosive,
          shouldLoop: false,
          colors: const [
            Colors.green,
            Colors.blue,
            Colors.pink,
            Colors.orange,
            Colors.purple,
          ],
        ),
      ],
    );
  }

  void _startConfetti() {
    _controller.play();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        _controller.stop();
        setState(() {});
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _startConfetti();
  }
}
