import 'package:cat_sanctuary/cat_sanctuary_list_item.dart';
import 'package:cat_sanctuary/cats.dart';
import 'package:flutter/material.dart';

class CatSanctuaryListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cats"),
        backgroundColor: Colors.brown,
      ),
      body: Column(
        children: [
          const SizedBox(height: 13),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Search",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final item = cats[index];
                return CatSanctuaryListItem(cats: item);
              },
              itemCount: cats.length,
            ),
          ),
        ],
      ),
    );
  }
}
