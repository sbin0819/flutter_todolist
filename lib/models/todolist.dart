import 'dart:convert';

Todo welcomeFromJson(String str) => Todo.fromJson(json.decode(str));

String welcomeToJson(Todo data) => json.encode(data.toJson());

class Todo {
  Todo({
    required this.content,
    required this.category,
    required this.isCompleted,
  });

  Todo.fromJson(Map<String, Object?> json)
      : this(
          content: json['content']! as String,
          category: json['category']! as String,
          isCompleted: json['isCompleted']! as bool,
        );

  final String content;
  final String category;
  final bool isCompleted;

  Map<String, Object?> toJson() => {
        "content": content,
        "category": category,
        "isCompleted": isCompleted,
      };
}
