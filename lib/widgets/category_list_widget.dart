import 'package:flutter/material.dart';
import './category_widget.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CategoryTextWidget(),
        SizedBox(
          height: 130.0,
          child: ListView(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              CategoryWidget(),
              CategoryWidget(),
              CategoryWidget(),
              CategoryWidget(),
              CategoryWidget(),
            ],
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
