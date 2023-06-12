import 'package:flutter/material.dart';

class CatSanctuaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          Spacer(),
          Image.network(
            'https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_square.jpg',
          ),
          Text(
            "Another Cat",
            style: TextStyle(fontSize: 20, color: Colors.brown),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
