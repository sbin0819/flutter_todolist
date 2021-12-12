import 'dart:convert';

Category welcomeFromJson(String str) => Category.fromJson(json.decode(str));

String welcomeToJson(Category data) => json.encode(data.toJson());

class Category {
  Category({
    required this.id,
    required this.title,
    required this.completed,
    required this.total,
  });

  String id;
  String title;
  int completed;
  int total;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "completed": completed,
        "total": total,
      };
}
