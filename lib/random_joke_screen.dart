import 'package:flutter/material.dart';

class RandomJokeScreen extends StatefulWidget {
  const RandomJokeScreen({super.key});

  @override
  State<RandomJokeScreen> createState() => _RandomJokeScreenState();
}

class _RandomJokeScreenState extends State<RandomJokeScreen> {
  String joke = 'PIADA';
  String imageUrl =
      'https://images01.military.com/sites/default/files/styles/full/public/2021-04/chucknorris.jpeg.jpg?itok=2b4A6n29';

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chuck Norris Jokes'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            if (imageUrl.isNotEmpty)
              Image.network(
                imageUrl,
              ),
            SizedBox(height: 30),
            Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    joke,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: style,
              onPressed: () {},
              child: const Text('New Joke!'),
            ),
          ],
        ),
      ),
    );
  }
}
