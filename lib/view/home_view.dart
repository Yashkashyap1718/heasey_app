import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:heasey_app/view/about_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Keep track of selected index
  int _selectedIndex = 2; // Default index (home)

  // List of pages for navigation
  final List<Widget> _pages = [
    // const SearchPage(),
    // const PhonePage(),
    const HomePage(), // HomePage itself, you can replace with other page if needed
    // const InfoPage(),
    const AboutUsPage(),
  ];

  // Handle bottom navigation tap
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
        child: Column(
          children: [
            // Banner Section with Carousel
            Container(
              margin: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 65, 64, 60),
                  borderRadius: BorderRadius.circular(6)),
              height: 200,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 120,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 16 / 9,
                        enableInfiniteScroll: true,
                        viewportFraction: 0.8,
                      ),
                      items: [
                        'assets/google.png',
                        'assets/google.png',
                        'assets/google.png',
                      ].map((imagePath) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Image.asset(
                              imagePath,
                              height: 120,
                              fit: BoxFit.cover,
                            );
                          },
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Sheecure deliver with trust",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Category Section
            Container(
              color: Colors.amber[300],
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButton<String>(
                    value: 'Gender',
                    items: ['Gender', 'Male', 'Female']
                        .map((item) =>
                            DropdownMenuItem(value: item, child: Text(item)))
                        .toList(),
                    onChanged: (value) {},
                  ),
                  DropdownButton<String>(
                    value: 'Category',
                    items: ['Category', 'Health', 'Wellness']
                        .map((item) =>
                            DropdownMenuItem(value: item, child: Text(item)))
                        .toList(),
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),

            // Product List
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: List.generate(4, (index) {
                  return const ProductCard();
                }),
              ),
            ),

            // Promotional Section
            Container(
              color: Colors.teal,
              height: 100,
              width: double.infinity,
              alignment: Alignment.center,
              child: const Text(
                "\$150    \$180",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow,
                ),
              ),
            ),

            // Information Section
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  InfoCard(title: "Why choose Us?", description: "Lorem Ipsum"),
                  SizedBox(height: 16),
                  InfoCard(
                      title: "Become a partner",
                      description: "Need a button - Join us or Book a Meeting"),
                ],
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar with modified home icon
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 24), // Smaller icons
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone, size: 24), // Smaller icons
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 50),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info, size: 24), // Smaller icons
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 24), // Smaller icons
            label: '',
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber[50],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/google.png', // Replace with your product image
            height: 60,
          ),
          const SizedBox(height: 8),
          const Text("Sheecure",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const Text("₹7999 ₹7009", style: TextStyle(fontSize: 12)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: .5),
                    borderRadius: BorderRadius.circular(4)),
                child: const Text("View"),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: .5),
                    borderRadius: BorderRadius.circular(4)),
                child: const Text("Buy Now"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String description;

  const InfoCard({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
      ),
    );
  }
}
