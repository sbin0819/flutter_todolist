import 'package:flutter/material.dart';
import '../screens/category_screen.dart';

class SampleCategory {
  final String id;
  final String title;
  final int completed;
  final int total;

  const SampleCategory({
    required this.id,
    required this.title,
    required this.completed,
    required this.total,
  });
}

class CategoryWidget extends StatelessWidget {
  CategoryWidget({
    Key? key,
    required this.id,
    required this.title,
    required this.completed,
    required this.total,
  }) : super(key: key);

  final String id;
  final String title;
  final int completed;
  final int total;

  @override
  Widget build(BuildContext context) {
    _completedTaskRatio() {
      return completed / total;
    }

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, CategoryScreen.routeName, arguments: {
          'id': id,
          'title': title,
        });
      },
      child: Container(
        margin: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 8.0),
        width: 210.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(16.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 22,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${total.toString()} tasks',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                title, // ! category title
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                height: 6,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: LinearProgressIndicator(
                    value: (_completedTaskRatio()),
                    backgroundColor: Colors.grey,
                    color: Colors
                        .pink[300], // ! Theme.of 기본 색상, 색상 정보가 있을 때 그걸로 변경
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class typeof {}
