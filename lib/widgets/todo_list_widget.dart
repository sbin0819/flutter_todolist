import 'package:flutter/material.dart';
import './todo_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TodoListWidget extends StatefulWidget {
  const TodoListWidget({Key? key}) : super(key: key);

  @override
  State<TodoListWidget> createState() => _TodoListWidgetState();
}

class _TodoListWidgetState extends State<TodoListWidget> {
  late List<dynamic> _todolist;

  final CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('api/user1/todos');

  Future<void> getData() async {
    QuerySnapshot querySnapshot = await _collectionRef.get();
    final response = querySnapshot.docs.map((doc) => doc.data()).toList();
    setState(() => _todolist = response);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
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
        _todolist.length < 0
            ? Text('작성 된 투두리스트가 없습니다.')
            : SizedBox(
                height: 400.0,
                child: ListView.builder(
                  itemCount: _todolist.length,
                  itemBuilder: (BuildContext context, int idx) {
                    return TodoWidget(todo: _todolist[idx]['content']);
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
