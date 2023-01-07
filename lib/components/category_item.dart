import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/screens/categories_meals_screen.dart';
import 'package:meals_app/utils/app_routes.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(this.category, {super.key});

  final Category category;

  void _selectCategory(BuildContext context) {
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (_) => CategoriesMealsScreen(this.category)));

    Navigator.of(context).pushNamed(AppRoutes.categoriesMeals, arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(15),
      onTap: () => _selectCategory(context),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [category.color.withOpacity(0.5), category.color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
