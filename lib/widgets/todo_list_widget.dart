import 'package:flutter/material.dart';
import './todo_widget.dart';

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "TODAY'S TASKS",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black26,
            fontWeight: FontWeight.bold,
          ),
        ),
        TodoWidget(),
        TodoWidget(),
        TodoWidget(),
        TodoWidget(),
        TodoWidget(),
      ],
    );
  }
}
