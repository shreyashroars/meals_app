import 'package:flutter/material.dart';

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
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: Center(
          child: Text(
            'Recipe of $categoryTitle is here!',
            style: const TextStyle(color: Colors.white, fontSize: 24),
          ),
        ));
  }
}
