import 'package:flutter/material.dart';
import 'package:meals_app/components/meal_item.dart';
import 'package:meals_app/models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen(this.favoriteMeals, {super.key});

  final List<Meal> favoriteMeals;

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isEmpty
        ? Center(
            child: Text('NÃO TEM FAVORITOS'),
          )
        : Center(
            child: ListView.builder(
                itemCount: favoriteMeals.length,
                itemBuilder: (ctx, index) {
                  return MealItem(favoriteMeals[index]);
                }),
          );
  }
}
