import 'package:flutter/material.dart';

// category 이름과 id 전달 받고 api를 호출함
class WriteTodoScreen extends StatelessWidget {
  static const routeName = '/write-todo';

  const WriteTodoScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Write')),
      body: Text('Write Todo'),
    );
  }
}
