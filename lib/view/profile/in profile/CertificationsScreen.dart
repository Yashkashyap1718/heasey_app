import 'package:flutter/material.dart';

class CertificationsScreen extends StatelessWidget {
  const CertificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Our Certifications",
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
          "This is the Our Certifications screen.",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
