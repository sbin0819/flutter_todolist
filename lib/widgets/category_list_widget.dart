import 'package:flutter/material.dart';
import './category_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../helpers/cloud_firestore_helper.dart';

class CategoryListWidget extends StatefulWidget {
  CategoryListWidget({Key? key}) : super(key: key);

  @override
  State<CategoryListWidget> createState() => _CategoryListWidgetState();
}

class _CategoryListWidgetState extends State<CategoryListWidget> {
  late List<dynamic> _categories;

  @override
  void initState() {
    super.initState();
    getData('api/user1/categories', (res) => setState(() => _categories = res))
        .whenComplete(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CategoryTextWidget(),
        SizedBox(
          height: 130.0,
          child: ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: _categories.length,
            itemBuilder: (BuildContext context, int idx) {
              return CategoryWidget(
                id: _categories[idx]['id'] as String,
                title: _categories[idx]['title'] as String,
                completed: _categories[idx]['completed'] as int,
                total: _categories[idx]['total'] as int,
              );
            },
          ),
        ),
      ],
    );
  }
}

class CategoryTextWidget extends StatelessWidget {
  const CategoryTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'CATEGORIES',
      style: TextStyle(
        fontSize: 16,
        color: Colors.black26,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
