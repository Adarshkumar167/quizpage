import 'dart:async';
import 'package:flutter/material.dart';

class Time extends StatefulWidget {
  const Time({Key? key}) : super(key: key);

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  int _remainingSeconds = 600;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (_remainingSeconds == 0) {
        timer.cancel();
        // Timer has ended, handle your logic here
      } else {
        setState(() {
          _remainingSeconds--;
        });
      }
    });
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;

    String formattedMinutes = minutes.toString().padLeft(2, '0');
    String formattedSeconds = remainingSeconds.toString().padLeft(2, '0');

    return '$formattedMinutes:$formattedSeconds';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      formatTime(_remainingSeconds),
      style: const TextStyle(
        fontSize: 16,
        color: Color.fromRGBO(196, 196, 196, 1),
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
