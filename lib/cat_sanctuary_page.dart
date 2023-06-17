import 'package:cat_sanctuary/cats.dart';
import 'package:flutter/material.dart';


class CatSanctuaryPage extends StatelessWidget {
  const CatSanctuaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now().day;
    final index = today % cats.length;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          cats[index].title,
          style: const TextStyle(color: Colors.white),
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
