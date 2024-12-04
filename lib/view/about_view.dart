import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[600],
        title: Row(
          children: [
            const Text(
              "Heasey",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.notifications, color: Colors.black),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.person, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title: Who we are?
              const Center(
                child: Text(
                  "Who we our?",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Mr. Director Section 1
              _buildDirectorCard(
                context,
                title: "Mr. Director",
                description:
                    "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum",
              ),

              const SizedBox(height: 16),

              // Mr. Director Section 2
              _buildDirectorCard(
                context,
                title: "Mr. Director",
                description:
                    "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum",
              ),

              const SizedBox(height: 32),

              // Divider
              const Divider(color: Colors.blueAccent, thickness: 1),

              const SizedBox(height: 16),

              // Title: What we do?
              const Center(
                child: Text(
                  "What we do?",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // What we do Content
              _buildContentCard(
                context,
                title: "The Ultimate Guide to Writing",
                description:
                    "Read a selection of opinion pieces from world-class journalists.",
                imagePath: 'assets/google.png', // Replace with your asset
                time: "3 days ago | 5 min read",
              ),

              const SizedBox(height: 16),

              Center(
                child: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Colors.indigo,
                  child: const Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 24, // Adjust icon size for perfect centering
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDirectorCard(BuildContext context,
      {required String title, required String description}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image/Icon Placeholder
        Image.asset(
          'assets/google.png', // Replace with your asset
          height: 80,
          width: 60,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 16),
        // Text Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContentCard(BuildContext context,
      {required String title,
      required String description,
      required String imagePath,
      required String time}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            imagePath, // Replace with your asset
            height: 120,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 8),
        // Title
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        // Description
        Text(
          description,
          style: TextStyle(fontSize: 14, color: Colors.grey[700]),
        ),
        const SizedBox(height: 4),
        // Time Info
        Text(
          time,
          style: TextStyle(fontSize: 12, color: Colors.grey[500]),
        ),
      ],
    );
  }
}
