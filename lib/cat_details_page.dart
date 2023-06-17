import 'dart:ui';

import 'package:cat_sanctuary/cat_sanctuary.dart';
import 'package:flutter/material.dart';

class CatDetailsPage extends StatefulWidget {
  const CatDetailsPage({super.key, required this.cat});

  final CatSanctuary cat;

  @override
  State<CatDetailsPage> createState() => _CatDetailsPageState();
}

class _CatDetailsPageState extends State<CatDetailsPage> {
  var _isAdopted = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
                    child: Image.network(
                      widget.cat.imageUrl,
                      height: 500,
                      width: 400,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image.network(
                    widget.cat.imageUrl,
                    height: 500,
                    width: 250,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                widget.cat.title,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                widget.cat.description,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(height: 50),
            if (!_isAdopted)
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 330,
                  child: OutlinedButton(
                    onPressed: () {
                      _changeAdoptionStatus();
                    },
                    child: const Text(
                      "Adopt",
                      style: TextStyle(color: Colors.brown),
                    ),
                  ),
                ),
              )
            else
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text("This cat has a family <3"),
              ),
          ],
        ),
      ),
    );
  }

  void _changeAdoptionStatus() {
    setState(() {
      _isAdopted = true;
    });
  }
}
