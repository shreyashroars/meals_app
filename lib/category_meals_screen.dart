import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  // final String categoryId;
  // final String categoryTitle;
  // CategoryMealScreen(this.categoryId, this.categoryTitle);
  @override
  Widget build(BuildContext context) {
    final RouteArg = ModalRoute.of(context).settings.arguments as Map;
    final categoryTitle = RouteArg['title'];
    final categoryId = RouteArg['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Text(categoryMeals[index].title);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
