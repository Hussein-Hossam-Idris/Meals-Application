import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';
import 'screens/category_meals_screen.dart';

import 'screens/catigories_screen.dart';
import 'package:meals_app/models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool> _filters = {
    "gluten":false,
    'lactose':false,
    'vegan':false,
    'vegetarian':false,
  };

  List<Meal> _favorites = [];

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String,bool> filterData){
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal){
        if(_filters['gluten'] == true && !meal.isGlutenFree){
          return false;
        }
        if(_filters['lactose'] == true && !meal.isLactoseFree){
          return false;
        }
        if(_filters['vegan'] == true && !meal.isVegan){
          return false;
        }
        if(_filters['vegetarian'] == true && !meal.isVegetarian){
          return false;
        }

        return true;

      }).toList();
    });
  }
  
  void _toggleFavorite(String mealId){
    final existingIndex = _favorites.indexWhere((meal)=> meal.id == mealId);
    if(existingIndex >= 0){
      ///if i find a meal already in favorites i remove it
      setState(() {
        _favorites.removeAt(existingIndex);
      });
    }else{
      setState(() {
        _favorites.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String mealId){
    return _favorites.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.pink,
        accentColor: Colors.white,
        backgroundColor: Colors.red,
        canvasColor: Color.fromRGBO(255,254,229,1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          bodyText1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          headline6: TextStyle(
            fontSize: 24,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.normal
          ),
        ),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/':(ctx) => TabsScreen(_favorites),
        CategoryMealsScreen.CategoryMealRouteName: (ctx) => CategoryMealsScreen(_availableMeals),
        MealDetailSCreen.routeName:(ctx) => MealDetailSCreen(_toggleFavorite,_isMealFavorite),
        FiltersScreen.routeName:(ctx)=>FiltersScreen(_setFilters,_filters),

      },
      ///if i try to go to route that is not in the routes table, i default to this route
      ///this is used for dynamic applications most of the time
      onGenerateRoute: (settings) {
        print(settings.arguments);
        ///if (settings.name == '/meal-detail'){
        ///     return ...;
        ///}else if(settings.name == 'some-other-page'){
        ///   return ...;
        ///}
      },
      ///if flutter fails to use both routes and onGenerateRoute it defaults to this
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => CategoriesScreen(),);
      },
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('DeliMeals'),
//       ),
//       body: CategoriesScreen(),
//     );
//   }
// }
