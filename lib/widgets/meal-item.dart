import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  MealItem(
      {@required this.title,
      @required this.imageUrl,
      @required this.duration,
      @required this.complexity,
      @required this.affordability});

  String get complexityText {
    if (complexity == Complexity.Simple) {
      return 'Simple';
    } else if (complexity == Complexity.Challenging) {
      return 'Challenging';
    } else {
      return 'Hard';
    }
  }

  String get affordabilityText {
    if (affordability == Affordability.Cheap) {
      return 'Cheap';
    } else if (affordability == Affordability.Pricey) {
      return 'Pricey';
    } else {
      return 'Luxurious';
    }
  }

  void selectedMeal() {}
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: selectedMeal,
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 10,
            margin: const EdgeInsets.all(8),
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                        child: Image.network(
                          imageUrl,
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        )),
                    Positioned(
                      bottom: 20,
                      right: 10,
                      child: Builder(builder: (context) {
                        return Center(
                          child: Container(
                            width: 300,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            color: Colors.black54,
                            child: Text(
                              title,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 26),
                              softWrap: true,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.schedule),
                          const SizedBox(width: 6),
                          Text(
                            '$duration min',
                            style: const TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.work),
                          const SizedBox(width: 6),
                          Text(
                            complexityText,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.attach_money),
                          const SizedBox(width: 6),
                          Text(
                            affordabilityText,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )));
  }
}
