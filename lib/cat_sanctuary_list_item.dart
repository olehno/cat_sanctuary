import 'package:cat_sanctuary/cat_sanctuary.dart';
import 'package:flutter/material.dart';


class CatSanctuaryListItem extends StatelessWidget {
  final CatSanctuary cats;

  const CatSanctuaryListItem({required this.cats});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image.network(
            cats.imageUrl,
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cats.title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const SizedBox(height: 10),
                Text(
                  cats.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
