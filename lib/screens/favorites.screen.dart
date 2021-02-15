import 'package:flutter/material.dart';
import 'package:meals_app/components/meal_item.component.dart';
import 'package:meals_app/models/meal.model.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        final meal = favoriteMeals[index];

        return MealItem(
          id: meal.id,
          title: meal.title,
          imageUrl: meal.imageUrl,
          duration: meal.duration,
          affordability: meal.affordability,
          complexity: meal.complexity,
        );
      },
      itemCount: favoriteMeals.length,
    );
  }
}
