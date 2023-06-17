import 'dart:convert';

List<Categories> categoriesFromJson(String str) =>
    List<Categories>.from(json.decode(str).map((x) => Categories.fromJson(x)));

String categoriesToJson(List<Categories> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Categories {
  String value;

  Categories({
    required this.value,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
      };
}
