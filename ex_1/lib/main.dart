import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HobbyPage(),
    ),
  );
}

class HobbyPage extends StatelessWidget {
  const HobbyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Hobbies'),
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        color: Colors.grey,
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            HobbyCard(
              title: 'Travelling',
              icon: Icons.travel_explore,
              color: Colors.green,
            ),
            SizedBox(height: 10),
            HobbyCard(
              title: 'Skating',
              icon: Icons.skateboarding,
              color: Colors.blueGrey,
            ),
          ],
        ),
      ),
    );
  }
}

// Reusable HobbyCard widget
class HobbyCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const HobbyCard({
    super.key,
    required this.title,
    required this.icon,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      padding: const EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 28,
          ),
          const SizedBox(width: 15),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
