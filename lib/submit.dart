import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  final VoidCallback onTap;

  const MyWidget({Key? key, required this.onTap}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool isTapped = false;

  void handleTap() {
    setState(() {
      isTapped = !isTapped;
    });
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    Color containerColor =
        isTapped ? const Color.fromRGBO(73, 229, 234, 1.0) : Colors.white;
    Color textColor =
        isTapped ? Colors.white : const Color.fromRGBO(73, 229, 234, 1.0);

    return GestureDetector(
      onTap: handleTap,
      child: Padding(
        padding:
            EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.05),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.25,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color.fromRGBO(73, 229, 234, 1.0),
            ),
            color: containerColor,
          ),
          child: Center(
            child: Text(
              'Submit',
              style: TextStyle(
                color: textColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
