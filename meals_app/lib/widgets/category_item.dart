import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title ;
  final Color color;
  final String imgPath;
  final Color txtColor;
  final String id;

  CategoryItem(this.title,this.color,this.imgPath,this.txtColor,this.id);

  void selecCategory(BuildContext context){
      Navigator.of(context).pushNamed(
        CategoryMealsScreen.CategoryMealRouteName,
        arguments: {'id':id,'title':title}
      );
  }

  final GlobalKey _backgroundImageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () =>selecCategory(context),
      splashColor: Colors.black,
      borderRadius: BorderRadius.circular(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w500,
                      color: txtColor,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.black38,
                //     blurRadius: 7,
                //     spreadRadius: 5,
                //     offset: Offset(0,5),
                //   ),
                // ],
                image: DecorationImage(
                  image: NetworkImage(imgPath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.8),
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.0),
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.8),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
