import 'package:flutter/material.dart';

class SubScreen extends StatelessWidget {
  static const routeName = '/sub';
  const SubScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sub screen')),
      body: Text('SUB SCREEN'),
    );
  }
}
