import 'package:flutter/material.dart';

import 'cats.dart';

class CatSanctuaryPage extends StatelessWidget {
  const CatSanctuaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now().day;
    final index = today % cats.length;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tobby Cat",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Image.network(cats[index].imageUrl),
          const Text(
            "Another Cat",
            style: TextStyle(fontSize: 20, color: Colors.brown),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
