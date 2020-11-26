import 'package:flutter/material.dart';
import 'package:fruitApp/data.dart';

class RecipeDetails extends StatelessWidget {
  static const String path = './categories/receipt-details';
  final Function _toggleFavorites;
  final Function _isFavorite;
  RecipeDetails(this._toggleFavorites, this._isFavorite);
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
        appBar: AppBar(
          title: Text(selectedMeal.title),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.favorite,
            color: _isFavorite(mealId) ? Colors.red : Colors.grey,
          ),
          onPressed: () {
            _toggleFavorites(mealId);
          },
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 300,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              instructionsTitle(context, 'Ingredients'),
              instructionsContainer(
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Text(
                            selectedMeal.ingredients[index],
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      );
                    },
                    itemCount: selectedMeal.ingredients.length),
              ),
              instructionsTitle(
                context,
                'Steps',
              ),
              instructionsContainer(
                child: ListView.builder(
                  itemBuilder: (context, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FittedBox(child: Text('${index + 1}')),
                          ),
                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      Divider(),
                    ],
                  ),
                  itemCount: selectedMeal.steps.length,
                ),
              ),
            ],
          ),
        ));
  }

  Container instructionsContainer({Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  Container instructionsTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
