import 'package:flutter/material.dart';

class TodoWidget extends StatelessWidget {
  TodoWidget({Key? key, required this.content, required this.isCompleted})
      : super(key: key);
  String content;
  bool isCompleted;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      width: double.infinity,
      height: 55.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(16.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 20),
          IconButton(
            onPressed: () {
              print(isCompleted);
            },
            icon: Icon(
              isCompleted ? Icons.circle_outlined : Icons.circle,
              color: Colors.pink[300],
            ),
          ),
          SizedBox(width: 15),
          Text(content),
        ],
      ),
    );
  }
}
