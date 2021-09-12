import 'package:flutter/material.dart';

import 'catigories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage('assets/images/italian.jpg'), context);
    precacheImage(AssetImage('assets/images/quickandeasy.jpg'), context);
    precacheImage(AssetImage('assets/images/hamburgers.jpg'), context);
    precacheImage(AssetImage('assets/images/german.jpg'), context);
    precacheImage(AssetImage('assets/images/lightandlovely.jpg'), context);
    precacheImage(AssetImage('assets/images/exotic.jpg'), context);
    precacheImage(AssetImage('assets/images/breakfast.jpg'), context);
    precacheImage(AssetImage('assets/images/asian.jpg'), context);
    precacheImage(AssetImage('assets/images/french.jpg'), context);
    precacheImage(AssetImage('assets/images/summer.jpg'), context);
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primaryColor: Colors.amber[100],
        accentColor: Colors.white,
        canvasColor: Color.fromRGBO(255,254,229,1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          bodyText1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          headline6: TextStyle(
            fontSize: 24,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.normal
          ),
        ),
      ),
      home: CategoriesScreen(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('DeliMeals'),
//       ),
//       body: CategoriesScreen(),
//     );
//   }
// }
