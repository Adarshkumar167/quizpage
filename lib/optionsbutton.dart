import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatefulWidget {
  final String text;
  final Function onPressed;
  final bool isCorrect;

  const CustomOutlinedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isCorrect = false,
  });

  @override
  State<CustomOutlinedButton> createState() => _CustomOutlinedButtonState();
}

class _CustomOutlinedButtonState extends State<CustomOutlinedButton> {
  bool _isSelected = false;

  String get iconPath {
    if (_isSelected) {
      if (widget.isCorrect) {
        return 'assets/image/correctans.png';
      } else {
        return 'assets/image/wrongans.png';
      }
    } else {
      return 'assets/image/startans.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    Color borderColor = Colors.black;
    Color backgroundColor = Colors.white;
    Color textColor = Colors.black;

    if (_isSelected) {
      if (widget.isCorrect) {
        borderColor = const Color.fromRGBO(73, 234, 118, 1.0);
        backgroundColor = const Color.fromRGBO(73, 234, 118, 1.0);
        textColor = Colors.white;
      } else {
        borderColor = const Color.fromRGBO(234, 73, 73, 1.0);
        backgroundColor = const Color.fromRGBO(234, 73, 73, 1.0);
        textColor = Colors.white;
      }
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.07,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.20,
            child: Padding(
              padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.05,
              ),
              child: SizedBox(
                child: Image.asset(iconPath), // Use the computed iconPath here
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width * 0.7,
            child: OutlinedButton(
              onPressed: () {
                setState(() {
                  _isSelected = !_isSelected;
                });
                widget.onPressed();
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(
                      color: borderColor,
                    ),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                  backgroundColor,
                ),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.text,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
