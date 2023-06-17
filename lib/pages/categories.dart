import 'package:flutter/material.dart';

import '../models/categories_model.dart';
import '../services/categories_service.dart';
import '../utils/custom_drawer.dart';
import 'category_detail.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  CategoriesScreenState createState() => CategoriesScreenState();
}

class CategoriesScreenState extends State<CategoriesScreen> {
  List<Categories>? categories;

  final Map<String, IconData> categoryIcons = {
    'animal': Icons.pets,
    'career': Icons.work,
    'celebrity': Icons.star,
    'dev': Icons.code,
    'explicit': Icons.warning,
    'fashion': Icons.shopping_bag,
    'food': Icons.restaurant,
    'history': Icons.history,
    'money': Icons.attach_money,
    'movie': Icons.movie,
    'music': Icons.music_note,
    'political': Icons.gavel,
    'religion': Icons.mood,
    'science': Icons.science,
    'sport': Icons.sports,
    'travel': Icons.flight,
  };

  @override
  void initState() {
    super.initState();
    handleGetCategories();
  }

  void handleGetCategories() async {
    final response = await getCategories();
    setState(() => categories = response);
  }

  void navigateToCategoryDetail(String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryDetailScreen(category: category),
      ),
    );
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
                final iconData = categoryIcons[category.value];
                return ListTile(
                  leading: Icon(iconData),
                  title: Text(category.value),
                  onTap: () => navigateToCategoryDetail(category.value),
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
