import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  static const routeName = '/category';

  CategoryScreen({Key? key, this.category}) : super(key: key);
  var category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CATEGORY')),
      body: Text('SUB SCREEN'),
    );
  }
}
