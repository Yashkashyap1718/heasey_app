import 'package:flutter/material.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Rewards",
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
          "This is the Rewards screen.",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
