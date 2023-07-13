import 'dart:async';

import 'package:cat_sanctuary/cat_details_page.dart';
import 'package:cat_sanctuary/cat_sanctuary.dart';
import 'package:cat_sanctuary/cat_sanctuary_list_item.dart';
import 'package:cat_sanctuary/cats_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatsSanctuaryListPage extends StatefulWidget {
  const CatsSanctuaryListPage({super.key});

  @override
  State<CatsSanctuaryListPage> createState() => _CatsSanctuaryListPageState();
}

class _CatsSanctuaryListPageState extends State<CatsSanctuaryListPage> {
  late final CatsRepository _catsRepository;
  Future<List<CatSanctuary>>? _catsFuture;
  final TextEditingController _searchController = TextEditingController();
  Timer? _debouncer;

  void _debounceSearch() {
    if (_debouncer != null) {
      _debouncer?.cancel();
    }
    _debouncer = Timer(const Duration(seconds: 1), () {
      final query = _searchController.text;
      setState(() {
        _catsFuture = _catsRepository.search(query);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _catsRepository = context.read();
    _catsFuture = _catsRepository.getCats();
    _searchController.addListener(() {
      _debounceSearch();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debouncer?.cancel();
    super.dispose();
  }

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
              controller: _searchController,
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
            child: FutureBuilder<List<CatSanctuary>>(
              future: _catsFuture,
              builder: (context, snapShot) {
                if (snapShot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final cats = snapShot.data ?? [];
                return Column(
                  children: [
                    TextFormField(
                      controller: _searchController,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          final item = cats[index];
                          return GestureDetector(
                              onTap: () {
                                _openCatDetailsPage(item);
                              },
                              child: CatSanctuaryListItem(cats: item));
                        },
                        itemCount: cats.length,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
  void _openCatDetailsPage(CatSanctuary item){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            CatDetailsPage(cat: item),
      ),
    );
  }
}
