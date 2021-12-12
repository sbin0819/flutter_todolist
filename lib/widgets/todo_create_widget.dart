import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../screens/home_screen.dart';

class TodoCreateWidget extends StatefulWidget {
  const TodoCreateWidget({Key? key}) : super(key: key);

  @override
  _TodoCreateWidgetState createState() => _TodoCreateWidgetState();
}

class _TodoCreateWidgetState extends State<TodoCreateWidget> {
  final _formKey = GlobalKey<FormState>();
  final _txtController = TextEditingController();

  CollectionReference todos =
      FirebaseFirestore.instance.collection('api/user1/todos');

  Future<void> addTodo(content) {
    return todos
        .add({
          'content': content,
          'category': 'Study',
          "isCompleted": false,
        })
        .then((value) => print("Todo Added"))
        .catchError((error) => print("Failed to add todo: $error"));
  }

  // @override
  // void initState() {
  //   super.initState();
  //   // Start listening to changes.
  //   _txtController.addListener(_printLatestValue);
  // }

  // void _printLatestValue() {
  //   print('Second text field: ${_txtController.text}');
  // }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _txtController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 80.0),
                ),
                TextFormField(
                  controller: _txtController,
                  autofocus: false,
                  style: TextStyle(
                    fontSize: 26,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: '할 일을 입력해주세요.',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                selectDateWidget(),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.create_new_folder_outlined,
                      size: 30,
                    ),
                    SizedBox(width: 35),
                    Icon(
                      Icons.flag_outlined,
                      size: 30,
                    ),
                    SizedBox(width: 35),
                    Icon(
                      Icons.alarm_add,
                      size: 30,
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 50.0),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      addTodo(_txtController.text);
                      Navigator.of(context).pushNamed(HomeScreen.routeName);
                      // Navigator.of(context).pop(false);
                      // Navigator.pop(context, true);
                      // showDialog(
                      //   context: context,
                      //   builder: (context) {
                      //     return AlertDialog(
                      //       content: Text(_txtController.text),
                      //     );
                      //   },
                      // );
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   const SnackBar(content: Text('Processing Data')),
                      // );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class selectDateWidget extends StatelessWidget {
  const selectDateWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            print('tap');
          },
          child: Container(
            height: 50.0,
            width: 122.0,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black12,
                width: 1.0,
                style: BorderStyle.solid,
              ),
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(16.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.calendar_today_outlined),
                SizedBox(width: 10),
                Text('Today')
              ],
            ),
          ),
        )
      ],
    );
  }
}
