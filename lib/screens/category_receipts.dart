import 'package:flutter/material.dart';

import 'package:fruitApp/models/meals.dart';
import 'package:fruitApp/widgets/Reciipe.dart';

class CategoryItems extends StatefulWidget {
  static const String path = '/categoriesItems';
  List<Meal> availableMeals;

  CategoryItems(this.availableMeals);

  @override
  _CategoryItemsState createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {
  String categoryTitle;

  List<Meal> filteredRecipeItems;
  initState() {
    //..
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArguments =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final categoryId = routeArguments['id'];
    categoryTitle = routeArguments['title'];

    filteredRecipeItems = widget.availableMeals
        .where(
          (meal) => meal.categories.contains(categoryId),
        )
        .toList();
    super.didChangeDependencies();
  }

  void deleteItem(String mealId) {
    setState(
      () {
        filteredRecipeItems.removeWhere((meal) => meal.id == mealId);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (ctx, number) {
            return Recipe(
              id: filteredRecipeItems[number].id,
              title: filteredRecipeItems[number].title,
              imageUrl: filteredRecipeItems[number].imageUrl,
              complexity: filteredRecipeItems[number].complexity,
              affordability: filteredRecipeItems[number].affordability,
              duration: filteredRecipeItems[number].duration,
            );
          },
          itemCount: filteredRecipeItems.length,
        ),
      ),
    );
  }
}
