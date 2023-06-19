import 'package:cat_sanctuary/cat_sanctuary_list_page.dart';
import 'package:cat_sanctuary/cat_sanctuary_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedTabIndex,
        children: [
          const CatsSanctuaryListPage(),
          const CatSanctuaryPage(),
          Container(
            color: Colors.yellow,
          ),
          Container(
            color: Colors.brown,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTabIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.brown,

        onTap: (index) {
          setState(() {
            _selectedTabIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Cat list",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.abc),
            label: "The cat of the day",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Yellow",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.safety_check),
            label: "Brown",
          ),
        ],
      ),
    );
  }
}
