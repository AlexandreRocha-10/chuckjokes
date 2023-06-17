import 'dart:convert';

RandomJoke randomJokeFromJson(String str) =>
    RandomJoke.fromJson(json.decode(str));

String randomJokeToJson(RandomJoke data) => json.encode(data.toJson());

class RandomJoke {
  String value;

  RandomJoke({
    required this.value,
  });

  factory RandomJoke.fromJson(Map<String, dynamic> json) => RandomJoke(
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
      };
}
