import 'package:flutter/material.dart';

class ProductDescriptionPage extends StatelessWidget {
  const ProductDescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Heasey',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Icon(Icons.notifications, color: Colors.black),
                SizedBox(width: 10),
                Icon(Icons.account_circle, color: Colors.black),
              ],
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              Center(
                child: Image.network(
                  'https://via.placeholder.com/150', // Replace with actual image URL
                  height: 120,
                ),
              ),
              const SizedBox(height: 16),
              // Product Title and Details
              const Text(
                'Liver Detoxify',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const Text(
                'Power capsules, multi vitamin',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 16),
              // Composition & Details
              const Text(
                'Compositions & Details',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              Container(
                color: Colors.yellow[100],
                height: 60,
                child: const Text(
                  'Details about the product...',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 16),
              // Reviews and Ratings
              const Text(
                'REVIEWS & RATING',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Row(
                children: List.generate(
                  5,
                  (index) => Icon(
                    index < 3 ? Icons.star : Icons.star_border,
                    color: Colors.yellow[700],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Column(
                children: List.generate(
                  3,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    color: Colors.yellow[100],
                    height: 40,
                    child: const Text('Review content here...'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // Footer Section
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.phone), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}
