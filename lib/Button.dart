import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Color;
  final textcolor;
  final String buttonText;
  final buttonpressed;

  MyButton(
      {required this.Color,
      required this.textcolor,
      required this.buttonText,
      required this.buttonpressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonpressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: Color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(color: textcolor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
