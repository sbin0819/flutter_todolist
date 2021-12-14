import 'dart:convert';

Todo todoFromJson(String str) => Todo.fromJson(json.decode(str));

String todoToJson(Todo data) => json.encode(data.toJson());

class Todo {
  final String content;
  final String category;
  final bool isCompleted;

  Todo({
    required this.content,
    required this.category,
    required this.isCompleted,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      content: json['content'] as String,
      category: json['category'] as String,
      isCompleted: json['isCompleted'] as bool,
    );
  }

  Map<String, Object?> toJson() => {
        "content": content,
        "category": category,
        "isCompleted": isCompleted,
      };
}
