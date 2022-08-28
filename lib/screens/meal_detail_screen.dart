import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/categorydetail-meal';

  Widget buildSectionTitle(String x, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        x,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.green,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
        appBar: AppBar(
          title: Text('${selectedMeal.title}'),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
              height: 270,
              width: double.infinity,
            ),
            buildSectionTitle('Ingredients', context),
            buildContainer(
              ListView.builder(
                  itemBuilder: (ctx, index) => Card(
                        color: Theme.of(context).colorScheme.secondary,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: Text(selectedMeal.ingredients[index]),
                        ),
                      ),
                  itemCount: selectedMeal.ingredients.length),
            ),
            buildSectionTitle('Steps', context),
            buildContainer(ListView.builder(
              itemBuilder: (ctx, index) => Column(children: [
                ListTile(
                  leading: CircleAvatar(child: Text('# ${index + 1}')),
                  title: Text(selectedMeal.steps[index]),
                ),
                Divider(
                  thickness: 5,
                )
              ]),
              itemCount: selectedMeal.steps.length,
            ))
          ],
        )));
  }
}
