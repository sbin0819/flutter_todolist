import 'package:flutter/material.dart';

// category 이름과 id 전달 받고 api를 호출함

class CategoryScreen extends StatelessWidget {
  static const routeName = '/category';

  final String title;
  final String id;

  const CategoryScreen({
    Key? key,
    required this.title,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CATEGORY')),
      body: Text(title),
    );
  }
}
