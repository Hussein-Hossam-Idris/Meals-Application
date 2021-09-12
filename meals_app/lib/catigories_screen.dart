import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'category_item.dart';
import 'dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("MyMeal"),),
      body: GridView(
        padding: EdgeInsets.fromLTRB(10,30,10,10),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 400,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES.map((e) => CategoryItem(e.title, e.color,e.imgPath,e.txtColor)).toList(),
      ),
    );
  }
}
