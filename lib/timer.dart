import 'package:flutter/material.dart';
import 'dart:async';

class Time extends StatefulWidget {
  final VoidCallback onTimerExpired;
  const Time({Key? key, required this.onTimerExpired}) : super(key: key);

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  int _remainingSeconds = 300;
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
        widget.onTimerExpired(); // Call the callback function
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
