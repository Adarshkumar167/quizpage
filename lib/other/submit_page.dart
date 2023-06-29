import 'package:flutter/material.dart';

class SummaryPage extends StatelessWidget {
  final int marks;

  const SummaryPage({Key? key, required this.marks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 0.8 * MediaQuery.of(context).size.width,
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(top: 20),
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
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                'assets/image/summary_page/medal_2.png',
                                width: MediaQuery.of(context).size.width * 0.3,
                              ),
                              Transform.translate(
                                offset: const Offset(-90, -65),
                                child: Image.asset(
                                  'assets/image/summary_page/star1.png',
                                  width: 70,
                                ),
                              ),
                              Transform.translate(
                                offset: const Offset(95, 35),
                                child: Image.asset(
                                  'assets/image/summary_page/star2.png',
                                  width: 90,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Join our daily challenge and win special gifts just for you',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
