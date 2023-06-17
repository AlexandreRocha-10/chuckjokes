import 'package:flutter/material.dart';

import '../models/random_joke_model.dart';
import '../services/random_joke_service.dart';
import '../utils/custom_drawer.dart';

class RandomJokeScreen extends StatefulWidget {
  const RandomJokeScreen({super.key});

  @override
  State<RandomJokeScreen> createState() => _RandomJokeScreenState();
}

class _RandomJokeScreenState extends State<RandomJokeScreen> {
  String value = 'Chuck Norris Jokes';
  String imageUrl =
      'https://images01.military.com/sites/default/files/styles/full/public/2021-04/chucknorris.jpeg.jpg?itok=2b4A6n29';
  RandomJoke? data;

  void handleGetRandomJoke() async {
    final response = await getRandomJoke();
    setState(() => data = response);
  }

  @override
  Widget build(BuildContext context) {
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
                child: data != null
                    ? ListTile(
                        title: Text(
                        data!.value,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                        softWrap: true,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ))
                    : ListTile(
                        title: Text(
                        value,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                        softWrap: true,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ))),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => handleGetRandomJoke(),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                shape: const StadiumBorder(),
              ),
              child: const Text(
                "New Joke!",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
