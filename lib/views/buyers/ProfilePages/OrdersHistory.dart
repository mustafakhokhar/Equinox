import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrdersHistoryPage extends StatelessWidget {
  const OrdersHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Orders History Page',
          style: TextStyle(fontSize: 36),
        ),
      ),
    );
  }
}