import 'package:flutter/material.dart';

import 'pages/categories.dart';
import 'pages/random_joke.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chuck Norris Jokes',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const RandomJokeScreen(),
        '/categories': (context) => const CategoriesScreen(),
      },
    );
  }
}
