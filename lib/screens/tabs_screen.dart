import 'package:flutter/material.dart';
import 'package:fruitApp/models/meals.dart';
import 'package:fruitApp/screens/categories_screen.dart';
import 'package:fruitApp/screens/favorites.dart';
import 'package:fruitApp/widgets/MainDrawer.dart';

class TabsScreen extends StatefulWidget {
  List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, dynamic>> _screens = [];
  int _pageIndex = 0;
  void _selectScreen(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  void initState() {
    _screens = [
      {
        'title': 'Categories',
        'page': Categories(),
      },
      {
        'title': 'Favorites',
        'page': Favorites(widget.favoriteMeals),
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_pageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _screens[_pageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectScreen,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.amber,
          currentIndex: _pageIndex,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            )
          ]),
    );
  }
}
