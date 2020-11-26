import 'package:flutter/material.dart';
import 'package:fruitApp/screens/category_receipts.dart';

class Category extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  Category(this.id, this.title, this.color);

  selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryItems.path, arguments: {
      'id': this.id,
      'title': this.title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Text(
          this.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
