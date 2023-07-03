import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {
  const HeadingText({this.text = 'data', Key? key}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontSize: MediaQuery.of(context).size.width * 0.058,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
