import 'package:flutter/material.dart';

import 'custom_drawer.dart';

class CategoriesScreen extends StatelessWidget {
  final List<String> categories = [
    'Animal',
    'Career',
    'Celebrity',
    'Dev',
    'Explicit',
    'Fashion',
    'Food',
    'History',
    'Money',
    'Movie',
    'Music',
    'Political',
    'Religion',
    'Science',
    'Sport',
    'Travel'
  ];

  CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Joke Categories'),
      ),
      drawer: const MyDrawer(),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(categories[index]), onTap: () {});
        },
      ),
    );
  }
}
