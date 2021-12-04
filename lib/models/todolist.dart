// ! DART class 작성법을 확인해 봐야함.
class Todolist {
  final String id;
  final String title;
  final String content;
  final bool isCompleted; // 없으면 false
  final String category; // 없으면 all
  // final Date createdAt;
  // final Date updatedAt;

  Todolist({
    required this.id,
    required this.title,
    required this.content,
    required this.isCompleted,
    required this.category,
  });
}
