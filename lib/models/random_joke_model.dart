class RandomJoke {
  String value;

  RandomJoke({
    required this.value,
  });

  factory RandomJoke.fromJson(Map<String, dynamic> json) => RandomJoke(
        value: json["value"],
      );
}
