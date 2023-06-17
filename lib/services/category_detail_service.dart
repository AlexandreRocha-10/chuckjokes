import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/random_joke_model.dart';

Future<RandomJoke> getCategoryJoke(String category) async {
  final url = "https://api.chucknorris.io/jokes/random?category=$category";

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return RandomJoke.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Falha ao obter a piada da categoria da API.");
  }
}
