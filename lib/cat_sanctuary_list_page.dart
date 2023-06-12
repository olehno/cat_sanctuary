import 'package:cat_sanctuary/cat_sanctuary_list_item.dart';
import 'package:flutter/material.dart';

import 'cats.dart';

class CatSanctuaryListPage extends StatelessWidget {
  final numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cats"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final item = cats[index];
          return CatSanctuaryListItem(cats: item);
        },
        itemCount: cats.length,
      ),
    );
  }

}