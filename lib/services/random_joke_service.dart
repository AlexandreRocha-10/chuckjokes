import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/random_joke_model.dart';

Future<RandomJoke> getRandomJoke() async {
  const url = "https://api.chucknorris.io/jokes/random";

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return RandomJoke.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Falha ao obter as piadas da API.");
  }
}
