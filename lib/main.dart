import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/screens/FilterScreen.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
//import 'package:meals_app/widgets/category_item.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

import 'models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };
  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favouriteMeals = [];
  void setFilters(Map<String, bool> filterdata) {
    setState(() {
      filters = filterdata;
      availableMeals = DUMMY_MEALS.where((meal) {
        if (filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleFavourites(String mealId) {
    setState(() {
      final existingIndex =
          favouriteMeals.indexWhere((meal) => meal.id == mealId);
      if (existingIndex >= 0) {
        favouriteMeals.removeAt(existingIndex);
      } else {
        favouriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      }
    });
  }

  bool isFavourite(String mealId) {
    return favouriteMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(secondary: const Color.fromARGB(255, 232, 37, 137)),
          canvasColor: Colors.white,
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(color: Color.fromRGBO(200, 51, 51, 1)),
              bodyText2: const TextStyle(color: Colors.black),
              headline6: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold))),
      //home: CategoriesScreen(),
      routes: {
        '/': (ctx) => TabsScreen(favouriteMeals),
        CategoryMealScreen.routeName: (ctx) =>
            CategoryMealScreen(availableMeals),
        MealDetailScreen.routeName: (ctx) =>
            MealDetailScreen(toggleFavourites, isFavourite),
        FilterScreen.routeName: (ctx) => FilterScreen(filters, setFilters)
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
