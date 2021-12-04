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
        const Text(
          "TODAY'S TASKS",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black26,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        // ? 내부에서 스크롤이 돌게 하기 위해서 SizedBox 에서 크기를 고정해줌
        todoList.length < 0
            ? Text('작성 된 투두리스트가 없습니다.')
            : SizedBox(
                height: 400.0,
                child: ListView.builder(
                  itemCount: todoList.length,
                  itemBuilder: (BuildContext context, int idx) {
                    return TodoWidget(todo: todoList[idx]);
                  },
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
