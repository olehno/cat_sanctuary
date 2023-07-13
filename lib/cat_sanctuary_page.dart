import 'package:cat_sanctuary/cat_sanctuary.dart';
import 'package:cat_sanctuary/cats_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatSanctuaryPage extends StatefulWidget {
  const CatSanctuaryPage({Key? key}) : super(key: key);

  @override
  State<CatSanctuaryPage> createState() => _CatSanctuaryPageState();
}

class _CatSanctuaryPageState extends State<CatSanctuaryPage> {
  late final CatsRepository catsRepository;
  Future<List<CatSanctuary>>? catsFuture;

  @override
  void initState() {
    super.initState();
    catsRepository = context.read<CatsRepository>();
    catsFuture = catsRepository.getCats();
  }

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
      body: FutureBuilder<List<CatSanctuary>>(
        future: catsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error loading cats: ${snapshot.error}",
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else {
            final cats = snapshot.data ?? [];
            if (cats.isEmpty) {
              return const Center(
                child: Text(
                  "No cats found",
                  style: TextStyle(fontSize: 20, color: Colors.brown),
                ),
              );
            }
            final today = DateTime.now().day;
            final index = today % cats.length;
            return Column(
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
            );
          }
        },
      ),
    );
  }
}
