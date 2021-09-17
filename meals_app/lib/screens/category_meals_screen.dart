import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const CategoryMealRouteName = '/category-meals';
  final List<Meal> meals;
  CategoryMealsScreen(this.meals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  late String categoryTitle;
  late List<Meal> displayedMeals;
  bool didInitState = false;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if(!didInitState){
      final routeArguments =
      ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      categoryTitle = routeArguments['title'] as String;
      final categoryId = routeArguments['id'];
      displayedMeals = widget.meals
          .where((meal) => meal.categories.contains(categoryId))
          .toList();
      didInitState =  true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId){
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              title: displayedMeals[index].title,
              imageUrl: displayedMeals[index].imageUrl,
              duration: displayedMeals[index].duration,
              complexity: displayedMeals[index].complexity,
              affordability: displayedMeals[index].affordability,
              id: displayedMeals[index].id,
            );
          },
          itemCount: displayedMeals.length,
        ));
  }
}
