import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Contact Us Page',
          style: TextStyle(fontSize: 36),
        ),
      ),
    );
  }
}