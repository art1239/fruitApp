import 'package:flutter/material.dart';
import 'package:fruitApp/models/meals.dart';

import 'package:fruitApp/widgets/Reciipe.dart';

class Favorites extends StatelessWidget {
  List<Meal> favorites = [];
  Favorites(this.favorites);
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: favorites
            .map((meal) => Recipe(
                id: meal.id,
                title: meal.title,
                imageUrl: meal.imageUrl,
                duration: meal.duration,
                affordability: meal.affordability,
                complexity: meal.complexity))
            .toList());
  }
}
