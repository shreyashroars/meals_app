// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
//import 'package:meals_app/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem(this.id, this.title, this.color);

  void selectedCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealScreen.routeName,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(22),
      child: Container(
          padding: const EdgeInsets.all(15),
          child: Text(title, style: Theme.of(context).textTheme.headline6),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.8), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(22),
          )),
    );
  }
}
