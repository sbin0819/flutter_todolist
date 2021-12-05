import 'package:flutter/material.dart';

class TodoCreateWidget extends StatefulWidget {
  const TodoCreateWidget({Key? key}) : super(key: key);

  @override
  _TodoCreateWidgetState createState() => _TodoCreateWidgetState();
}

class _TodoCreateWidgetState extends State<TodoCreateWidget> {
  final _formKey = GlobalKey<FormState>();
  final _txtController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    _txtController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _txtController.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    print('Second text field: ${_txtController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: TextFormField(
                  controller: _txtController,
                  autofocus: true,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: '할 일을 입력해주세요.',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(_txtController.text),
                        );
                      },
                    );
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
      ],
    );
  }
}
