import 'package:flutter/material.dart';
import './category_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryListWidget extends StatefulWidget {
  CategoryListWidget({Key? key}) : super(key: key);

  @override
  State<CategoryListWidget> createState() => _CategoryListWidgetState();
}

class _CategoryListWidgetState extends State<CategoryListWidget> {
  late List<dynamic> _categories;

  final CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('api/user1/categories');

  Future<void> getData() async {
    QuerySnapshot querySnapshot = await _collectionRef.get();
    final response = querySnapshot.docs.map((doc) => doc.data()).toList();
    setState(() => _categories = response);
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
