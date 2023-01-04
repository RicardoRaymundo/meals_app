

import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(this.category, {super.key});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Text(category.title);
  }
}