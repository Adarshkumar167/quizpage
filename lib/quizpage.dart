import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final selectedNumber = 2;
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.pause_circle_filled_rounded,
              color: Color.fromRGBO(196, 196, 196, 1),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.01),
            const Text(
              '09:05',
              style: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(196, 196, 196, 1),
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.05),
            child: OutlinedButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(const Size(100, 40)),
                side: MaterialStateProperty.all(
                  const BorderSide(
                    color: Color.fromRGBO(73, 229, 234, 1.0),
                  ),
                ),
              ),
              onPressed: () {},
              child: const Text(
                'Submit',
                style: TextStyle(
                  color: Color.fromRGBO(73, 229, 234, 1.0),
                  fontSize: 16,
                ),
              ),
            ),
          ),
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
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    final number = index + 1;
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
                          fontSize: 16,
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
                          fontSize: 16,
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
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '2.',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Icon(
                      Icons.bookmark_border_outlined,
                      color: Color.fromRGBO(73, 229, 234, 1.0),
                      size: 24,
                    ),
                  ],
                ),
              ),
              const Text(
                'Which of following is the fastest means of transportation?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'A. Roadways',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'B. Airways',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'C. Waterways',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'D. Railways',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
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
                  SizedBox(width: MediaQuery.of(context).size.width * 0.07),
                  Container(
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
