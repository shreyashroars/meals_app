import 'package:flutter/material.dart';
import 'package:meals_app/screens/FilterScreen.dart';

class MainDrawer extends StatelessWidget {
  static const routeName = '/categorydetail-meal';
  //const MainDrawer({ Key? key }) : super(key: key);
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 27,
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          color: Colors.purple,
          alignment: Alignment.centerLeft,
          child: const Text(
            'Cooking Up',
            style: TextStyle(
                fontWeight: FontWeight.w900, color: Colors.white, fontSize: 30),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        buildListTile('Meals', Icons.restaurant, () {
          Navigator.of(context).pushReplacementNamed('/');
        }),
        buildListTile('Filters', Icons.settings, () {
          Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
        })
      ],
    ));
  }
}
