import 'package:flutter/material.dart';

class SummaryPage extends StatelessWidget {
  final int marks;

  const SummaryPage({Key? key, required this.marks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Summary'),
      ),
      body: Center(
        child: Text(
          'Marks Obtained: $marks',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
