import 'package:flutter/material.dart';
import 'package:fruitApp/data.dart';
import 'package:fruitApp/widgets/Categories.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: GridView(
        children: DUMMY_CATEGORIES
            .map((e) => Category(e.id, e.title, e.color))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
      ),
    );
  }
}
