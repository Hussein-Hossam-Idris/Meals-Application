import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';
class FavoritesScreen extends StatelessWidget {
  final List<Meal> favorites;
  FavoritesScreen(this.favorites);

  @override
  Widget build(BuildContext context) {
    if(favorites.isEmpty){
      return Container(
        child: Center(
          child: Text('You don \' have any favorites yet, try adding some!',
          style: Theme.of(context).textTheme.headline6,textAlign: TextAlign.center,),
        ),
      );
    }else{
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            title: favorites[index].title,
            imageUrl: favorites[index].imageUrl,
            duration: favorites[index].duration,
            complexity: favorites[index].complexity,
            affordability: favorites[index].affordability,
            id: favorites[index].id,
          );
        },
        itemCount: favorites.length,
      );
    }

  }
}
