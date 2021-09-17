import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters_screen.dart';
class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              height: 70,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              color: Theme.of(context).primaryColor,
              child: Text('Menu',
                style: TextStyle(
                  fontSize: 30,
                  color: Theme.of(context).accentColor,
                ),
              ),
            ),
            SizedBox(height: 30,),
            InkWell(
              onTap: (){
                Navigator.of(context).pushReplacementNamed('/');
              },
              splashColor: Colors.white,
              child: ListTile(
                leading: Icon(Icons.restaurant_outlined, size: 26, color: Theme.of(context).primaryColor,),
                title: Text("Meals",
                style: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 24,
                ),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
              },
              splashColor: Colors.white,
              child: ListTile(
                leading: Icon(Icons.filter_alt_rounded, size: 26, color: Colors.black,),
                title: Text("Filters",
                  style: TextStyle(
                    fontFamily: 'RobotoCondensed',
                    fontSize: 24,
                  ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
