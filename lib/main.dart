import 'package:flutter/material.dart';
import 'package:meals_app/categories_screen.dart';
import 'package:meals_app/category_item.dart';
import 'package:meals_app/category_meals_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(secondary: Colors.lightBlue),
          canvasColor: const Color.fromRGBO(90, 70, 89, 0.4),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(color: Color.fromRGBO(200, 51, 51, 1)),
              bodyText2:
                  const TextStyle(color: Color.fromRGBO(200, 200, 255, 1)),
              headline6: const TextStyle(
                  fontSize: 24,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold))),
      //home: CategoriesScreen(),
      routes: {
        '/': (ctx) => CategoriesScreen(),
        CategoryMealScreen.routeName: (ctx) => CategoryMealScreen()
      },
    );
  }
}
