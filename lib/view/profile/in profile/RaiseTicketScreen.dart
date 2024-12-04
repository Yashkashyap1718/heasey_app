import 'package:flutter/material.dart';

class RaiseTicketScreen extends StatelessWidget {
  const RaiseTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Raise a Ticket",
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
          "This is the Raise a Ticket screen.",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
