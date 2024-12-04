import 'package:flutter/material.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Account",
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
          "This is the My Account screen.",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
