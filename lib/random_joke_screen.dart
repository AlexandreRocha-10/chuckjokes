import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'custom_drawer.dart';

Future<Joke> fetchJoke() async {
  final response =
      await http.get(Uri.parse('https://api.chucknorris.io/jokes/random'));

  if (response.statusCode == 200) {
    return Joke.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Joke');
  }
}

class Joke {
  final String id;
  final String value;

  const Joke({
    required this.id,
    required this.value,
  });

  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
      id: json['id'],
      value: json['value'],
    );
  }
}

class RandomJokeScreen extends StatefulWidget {
  const RandomJokeScreen({super.key});

  @override
  State<RandomJokeScreen> createState() => _RandomJokeScreenState();
}

class _RandomJokeScreenState extends State<RandomJokeScreen> {
  late Future<Joke> futureJoke;
  String imageUrl =
      'https://images01.military.com/sites/default/files/styles/full/public/2021-04/chucknorris.jpeg.jpg?itok=2b4A6n29';

  @override
  void initState() {
    super.initState();
    futureJoke = fetchJoke();
  }

  void setFutureJoke() {
    setState(() {
      futureJoke = fetchJoke();
    });
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chuck Norris Jokes'),
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            if (imageUrl.isNotEmpty)
              Image.network(
                imageUrl,
              ),
            const SizedBox(height: 30),
            Container(
              constraints: const BoxConstraints(
                minWidth: 200,
                minHeight: 100,
              ),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: FutureBuilder<Joke>(
                future: futureJoke,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data!.value,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: true,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    );
                  } else if (snapshot.hasError) {
                    return Text(
                      '${snapshot.error}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: true,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: style,
              onPressed: () => setFutureJoke(),
              child: const Text('New Joke!'),
            ),
          ],
        ),
      ),
    );
  }
}
