import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favourite_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  List<Meal> favouriteMeals;
  TabsScreen(this.favouriteMeals);
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Widget> arr;
  @override
  void initState() {
    super.initState();
    arr = [
      CategoriesScreen(),
      FavouriteScreen(widget.favouriteMeals),
    ];
  }

  int selectedPageIndex = 0;
  void _selectededPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title:
              Text(selectedPageIndex == 0 ? 'Categories' : 'Your Favourites'),
        ),
        drawer: Drawer(child: MainDrawer()),
        body: arr[selectedPageIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectededPage,
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          type: BottomNavigationBarType.shifting,
          currentIndex: selectedPageIndex,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.favorite_outlined),
              label: 'Favourites',
            ),
          ],
        ),
      ),
    );
  }
}
