import 'package:flutter/material.dart';
import './data.dart';
import 'package:fruitApp/models/meals.dart';
import 'package:fruitApp/screens/category_receipts.dart';
import 'package:fruitApp/screens/recipeDetails_screen.dart';
import 'package:fruitApp/screens/settings.dart';
import 'package:fruitApp/screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, dynamic> filters = {
    'Gluttenfree': false,
    'isVegan': false,
    'isVegetarian': false,
    'Lactosefree': false,
  };

  List<Meal> availableMeals = DUMMY_MEALS;

  List<Meal> favoriteMeal = [];

  void _toggleFavorites(String mealId) {
    final favoriteMealPresentAt =
        favoriteMeal.indexWhere((meal) => meal.id == mealId);
    if (favoriteMealPresentAt >= 0) {
      setState(() {
        favoriteMeal.removeAt(favoriteMealPresentAt);
      });
    } else {
      setState(() {
        favoriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isFavorite(String id) {
    return favoriteMeal.any((element) => element.id == id);
  }

  _saveChanges(Map<String, dynamic> filters) {
    setState(() {
      this.filters = filters;
      availableMeals = DUMMY_MEALS.where((meal) {
        if (!meal.isGlutenFree && filters['Gluttenfree']) {
          return false;
        }
        if (!meal.isLactoseFree && filters['Lactosefree']) {
          return false;
        }
        if (!meal.isVegetarian && filters['isVegetarian']) {
          return false;
        }
        if (!meal.isVegan && filters['isVegan']) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruit Application',
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primarySwatch: Colors.blueGrey,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData().textTheme.copyWith(
                bodyText1: TextStyle(
                  color: Color.fromRGBO(255, 254, 229, 1),
                ),
                bodyText2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                headline6: TextStyle(
                    fontFamily: 'RobotoCondensed',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
          fontFamily: 'Raleway'),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(favoriteMeal),
        CategoryItems.path: (ctx) => CategoryItems(availableMeals),
        RecipeDetails.path: (ctx) =>
            RecipeDetails(_toggleFavorites, _isFavorite),
        Settings.path: (ctx) => Settings(filters, _saveChanges),
      },
    );
  }
}
