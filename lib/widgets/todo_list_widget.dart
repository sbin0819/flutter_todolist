import 'package:flutter/material.dart';
import './todo_widget.dart';

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<String> todoList = [
      "Buy Milk",
      'Clean The Room',
      'Learn Flutter',
      'Call Parents',
      'Eat Healthy Food',
      "Sleep Tight",
      "Buy Milk",
      'Clean The Room',
      'Learn Flutter',
      'Call Parents',
      'Eat Healthy Food',
      "Sleep Tight",
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "TODAY'S TASKS",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black26,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        // getTodoWidget(todoList),
        SizedBox(
          height: 400.0,
          child: ListView(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            children: [
              TodoWidget(todo: 'hi'),
              TodoWidget(todo: 'hi'),
              TodoWidget(todo: 'hi'),
              TodoWidget(todo: 'hi'),
              TodoWidget(todo: 'hi'),
              TodoWidget(todo: 'hi'),
              TodoWidget(todo: 'hi'),
              TodoWidget(todo: 'hi'),
              TodoWidget(todo: 'hi'),
            ],
          ),
        ),
      ],
    );
  }
}

Widget getTodoWidget(List<String> strings) {
  return Column(
      children: strings.map((todo) => TodoWidget(todo: todo)).toList());
}
