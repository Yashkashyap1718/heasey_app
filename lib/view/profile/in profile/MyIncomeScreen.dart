import 'package:flutter/material.dart';

class MyIncomeScreen extends StatelessWidget {
  const MyIncomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Income",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
            letterSpacing: 1.2,
          ),
        ),
      ),
      body: const Center(
        child: Text(
          "This is the My Income screen.",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
