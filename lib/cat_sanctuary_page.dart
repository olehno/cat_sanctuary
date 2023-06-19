import 'package:cat_sanctuary/cat_sanctuary.dart';
import 'package:cat_sanctuary/cats_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatSanctuaryPage extends StatefulWidget {
  const CatSanctuaryPage({super.key});

  @override
  State<CatSanctuaryPage> createState() => _CatSanctuaryPageState();
}

class _CatSanctuaryPageState extends State<CatSanctuaryPage> {
  @override
  Widget build(BuildContext context) {
    late final CatsRepository catsRepository;
    Future<List<CatSanctuary>>? catsFuture;

    @override
    void initState() {
      super.initState();
      catsRepository = context.read();
      catsFuture = catsRepository.getCats();
    }


    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tobby Cat",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown,
      ),
      body: Expanded(
        child: FutureBuilder<List<CatSanctuary>>(
          future: catsFuture,
          builder: (context, snapShot) {
            if (snapShot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final cats = snapShot.data ?? [];
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
          },
        ),
      ),
    );
  }
}
