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
      "Sleep Tight"
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
        getTodoWidget(todoList),
      ],
    );
  }
}

Widget getTodoWidget(List<String> strings) {
  return Column(
      children: strings.map((todo) => TodoWidget(todo: todo)).toList());
}

Widget getListView(BuildContext context, List<String> todoList) {
  return ListView.builder(
    itemCount: todoList.length,
    itemBuilder: (BuildContext context, int index) {
      return TodoWidget(todo: todoList[index]);
    },
  );
}
