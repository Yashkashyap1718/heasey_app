import 'package:flutter/material.dart';

class MyReferralsScreen extends StatelessWidget {
  const MyReferralsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Referrals",
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
          "This is the My Referrals screen.",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
