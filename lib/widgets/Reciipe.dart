import 'package:flutter/material.dart';
import 'package:fruitApp/models/meals.dart';
import 'package:fruitApp/screens/recipeDetails_screen.dart';
import 'package:fruitApp/widgets/RecipeAttributes.dart';

class Recipe extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  Recipe({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.affordability,
    @required this.complexity,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Easy:
        return 'Easy';
        break;
      case Complexity.Medium:
        return 'Medium';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Cheap:
        return 'Cheap';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Expensive:
        return 'Expensive';
        break;
      default:
        return 'Unknown';
    }
  }

  void selectReceipt(BuildContext ctx) {
    Navigator.pushNamed(ctx, RecipeDetails.path, arguments: this.id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectReceipt(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MenuItemAttribute(
                    text: '$duration min',
                    icon: Icons.schedule,
                  ),
                  MenuItemAttribute(
                    text: complexityText,
                    icon: Icons.work,
                  ),
                  MenuItemAttribute(
                    text: affordabilityText,
                    icon: Icons.monetization_on,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
