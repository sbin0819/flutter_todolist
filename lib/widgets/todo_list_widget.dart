import 'package:flutter/material.dart';
import './todo_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../helpers/cloud_firestore_helper.dart';

class TodoListWidget extends StatefulWidget {
  const TodoListWidget({Key? key}) : super(key: key);

  @override
  State<TodoListWidget> createState() => _TodoListWidgetState();
}

class _TodoListWidgetState extends State<TodoListWidget> {
  final String category_key = 'Study';
  late List<dynamic> _todolist;
  final CollectionReference _collectionRef = getCollection('user1', 'todos');

  Future<void> getData() async {
    QuerySnapshot querySnapshot = await _collectionRef.get();
    final response = querySnapshot.docs.map((doc) => doc.data()).toList();
    // ? filter 방식이 이게 맞을지 잘 모르겠다.
    // final filtered = response
    //     .where((dynamic element) => element['category'] == category_key)
    //     .toList();
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
        _todolist.length < 1
            ? Text('작성된 투두리스트가 없습니다.')
            : SizedBox(
                height: 400.0,
                child: ListView.builder(
                  itemCount: _todolist.length,
                  itemBuilder: (BuildContext context, int idx) {
                    return TodoWidget(
                      content: _todolist[idx]['content'],
                      isCompleted: _todolist[idx]['isCompleted'],
                    );
                  },
                ),
              ),
      ],
    );
  }
}
