import 'package:flutter/material.dart';

import '../models/categories_model.dart';
import '../services/categories_service.dart';
import '../utils/custom_drawer.dart';

class CategoriesScreen extends StatefulWidget {
  CategoriesScreen({super.key});

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Categories>? categories;

  @override
  void initState() {
    super.initState();
    handleGetCategories();
  }

  void handleGetCategories() async {
    final response = await getCategories();
    setState(() => categories = response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Joke Categories'),
      ),
      drawer: const MyDrawer(),
      body: categories != null
          ? ListView.builder(
              itemCount: categories!.length,
              itemBuilder: (context, index) {
                final category = categories![index];
                return ListTile(
                  title: Text(category.value),
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
