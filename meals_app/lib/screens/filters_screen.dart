import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:meals_app/widgets/drawer_content.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final void Function(Map<String,bool>) saveFilters;
  final Map<String,bool> _curFilters;
  FiltersScreen(this.saveFilters,this._curFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _buildSwitchListTile(String title, String subtitle, bool curVal,
      void Function(bool) updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: curVal,
      onChanged: updateValue,
      activeColor: Theme.of(context).primaryColor,
    );
  }
  @override
  void initState() {
    _glutenFree = widget._curFilters['gluten'] as bool;
    _lactoseFree = widget._curFilters['lactose'] as bool;
    _vegetarian = widget._curFilters['vegetarian'] as bool;
    _vegan = widget._curFilters['vegan'] as bool;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          title: Text('Applied Filters'),
          actions: [IconButton(onPressed:(){
            Map<String,bool> _filters = {
              "gluten":_glutenFree,
              'lactose':_lactoseFree,
              'vegan':_vegan,
              'vegetarian':_vegetarian,
            };
            widget.saveFilters(_filters);
            Navigator.of(context).pushReplacementNamed('/');
          }, icon: Icon(Icons.save))],
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _buildSwitchListTile('Gluten-free',
                    'Only include gluten_free meals', _glutenFree, (newVal) {
                  setState(() {
                    _glutenFree = newVal;
                  });
                }),
                Divider(
                  thickness: 2,
                ),
                _buildSwitchListTile('Lactose-free',
                    'Only include lactose-free meals', _lactoseFree, (newVal) {
                  setState(() {
                    _lactoseFree = newVal;
                  });
                }),
                Divider(
                  thickness: 2,
                ),
                _buildSwitchListTile(
                    'Vegetarian', 'Only include vegetarian meals', _vegetarian,
                    (newVal) {
                  setState(() {
                    _vegetarian = newVal;
                  });
                }),
                Divider(
                  thickness: 2,
                ),
                _buildSwitchListTile(
                    'Vegan', 'Only include vegan meals', _vegan, (newVal) {
                  setState(() {
                    _vegan = newVal;
                  });
                }),
              ],
            ))
          ],
        ));
  }
}
