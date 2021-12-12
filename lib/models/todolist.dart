import 'dart:convert';

Todo welcomeFromJson(String str) => Todo.fromJson(json.decode(str));

String welcomeToJson(Todo data) => json.encode(data.toJson());

class Todo {
  Todo({
    required this.content,
    required this.category,
  });

  Todo.fromJson(Map<String, Object?> json)
      : this(
          content: json['content']! as String,
          category: json['category']! as String,
        );

  final String content;
  final String category;

  Map<String, Object?> toJson() => {
        "content": content,
        "category": category,
      };
}
