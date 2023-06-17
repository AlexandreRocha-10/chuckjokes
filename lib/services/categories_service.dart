import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/categories_model.dart';

Future<List<Categories>> getCategories() async {
  const url = "https://api.chucknorris.io/jokes/categories";

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final List<dynamic> categoryList = jsonDecode(response.body);
    final List<Categories> categories = categoryList
        .map((category) => Categories(value: category.toString()))
        .toList();
    return categories;
  } else {
    throw Exception("Falha ao obter as categorias da API.");
  }
}
