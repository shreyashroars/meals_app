import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  //const FilterScreen({ Key? key }) : super(key: key);
  static const routeName = '/Filter-meal';
  final Function saveFilters;
  final Map<String, bool> filters;
  FilterScreen(this.filters, this.saveFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _GlutenFree = false;
  bool _LactoseFree = false;
  bool _Vegan = false;
  bool _Vegetarian = false;
  @override
  void initState() {
    super.initState();
    _GlutenFree = widget.filters['gluten'];
    _LactoseFree = widget.filters['lactose'];
    _Vegan = widget.filters['vegan'];
    _Vegetarian = widget.filters['vegetarian'];
  }

  Widget buildSwitchListTile(String title, bool currentValue,
      String description, Function updatesValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updatesValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Filters'),
          actions: [
            IconButton(
                onPressed: () {
                  final selectedFilters = {
                    'gluten': _GlutenFree,
                    'lactose': _LactoseFree,
                    'vegan': _Vegan,
                    'vegetarian': _Vegetarian
                  };
                  widget.saveFilters(selectedFilters);
                },
                icon: const Icon(Icons.save))
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              child: Text('Adjust your meal selection',
                  style: Theme.of(context).textTheme.headline6),
              padding: const EdgeInsets.all((20)),
            ),
            Expanded(
              child: ListView(children: [
                buildSwitchListTile('GlutenFree', _GlutenFree,
                    'Always contain meals with no Gluten', (newvalue) {
                  setState(() {
                    _GlutenFree = newvalue;
                  });
                }),
                buildSwitchListTile('LactoseFree', _LactoseFree,
                    'Always contain meals with no Lactose', (newvalue) {
                  setState(() {
                    _LactoseFree = newvalue;
                  });
                }),
                buildSwitchListTile('Vegetarian', _Vegetarian,
                    'Always contain Vegetarian Meals', (newvalue) {
                  setState(() {
                    _Vegetarian = newvalue;
                  });
                }),
                buildSwitchListTile(
                    'Vegan', _Vegan, 'Always contain Vegan Meals', (newvalue) {
                  setState(() {
                    _Vegan = newvalue;
                  });
                }),
              ]),
            )
          ],
        ));
  }
}
