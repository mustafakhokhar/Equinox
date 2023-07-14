import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {
  const HeadingText({this.text = 'data', this.linkString = 'See All',this.link, Key? key})
      : super(key: key);
  final String text;
  final String linkString;
  final Function? link;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontSize: MediaQuery.of(context).size.width * 0.058,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextButton(
          child: Text(
            linkString,
            style: TextStyle(
              color: Colors.blue,
              fontSize: MediaQuery.of(context).size.width * 0.033,
              // fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            if (link != null) {
              link!();
            } else {
              print('No link');
            }
          },
        ),
      ],
    );
  }
}
