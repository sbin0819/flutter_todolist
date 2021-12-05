import 'package:flutter/material.dart';

import '../widgets/todo_create_widget.dart';

class WriteTodoScreen extends StatelessWidget {
  static const routeName = '/write-todo';

  const WriteTodoScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TodoCreateWidget(),
      ),
    );
  }
}
