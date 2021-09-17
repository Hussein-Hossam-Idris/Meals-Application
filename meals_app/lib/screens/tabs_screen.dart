import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/catigories_screen.dart';
import 'package:meals_app/widgets/drawer_content.dart';

import 'favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> _favorites;
  TabsScreen(this._favorites);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late final List<Map<String,Object>> _pages;
  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _pages  = [
    {"page":CategoriesScreen(), 'title':'Categories'},
    {"page":FavoritesScreen(widget._favorites), 'title':'Your Favorites'}
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ///how to make a bottom navigation bar
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('My Meals App'),
      ),
      body: _pages[_selectedPageIndex]["page"] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.fastfood), label: "Categories"),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.favorite), label: "Favorites")
        ],
      ),
    );

  }
}
