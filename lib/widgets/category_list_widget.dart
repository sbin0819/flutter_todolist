import 'package:flutter/material.dart';
import './category_widget.dart';

class CategoryListWidget extends StatelessWidget {
  CategoryListWidget({Key? key}) : super(key: key);

  final List<Map<String, Object>> categoryList = [
    {
      'id': 'Important',
      'title': 'Important',
      'completed': 3,
      'total': 10,
    },
    {
      'id': 'Personal',
      'title': 'Personal',
      'completed': 23,
      'total': 47,
    },
    {
      'id': 'Study',
      'title': 'Study',
      'completed': 13,
      'total': 19,
    },
    {
      'id': 'Work',
      'title': 'Work',
      'completed': 18,
      'total': 23,
    },
  ];
  @override
  // CategoryWidget(id: 'id', title: 'abcd', completed: 10, total: 20),
  //  physics: const ClampingScrollPhysics(),
  //         shrinkWrap: true,
  //         scrollDirection: Axis.horizontal,
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
            itemCount: categoryList.length,
            itemBuilder: (BuildContext context, int idx) {
              return CategoryWidget(
                id: categoryList[idx]['id'] as String,
                title: categoryList[idx]['title'] as String,
                completed: categoryList[idx]['completed'] as int,
                total: categoryList[idx]['total'] as int,
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
