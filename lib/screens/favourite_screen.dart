import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal-item.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;
  //const FavouriteScreen({ Key? key }) : super(key: key);
  FavouriteScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    return favouriteMeals.isEmpty
        ? Center(
            child: Text(
              'No Favourites added',
              style: Theme.of(context).textTheme.headline6,
            ),
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return MealItem(
                  id: favouriteMeals[index].id,
                  title: favouriteMeals[index].title,
                  imageUrl: favouriteMeals[index].imageUrl,
                  duration: favouriteMeals[index].duration,
                  complexity: favouriteMeals[index].complexity,
                  affordability: favouriteMeals[index].affordability);
            },
            itemCount: favouriteMeals.length,
          );
  }
}
