import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title ;
  final Color color;
  final String imgPath;
  final Color txtColor;

  CategoryItem(this.title,this.color,this.imgPath,this.txtColor);

  void selecCategory(BuildContext context){
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => CategoryMealsScreen(),)
      );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>selecCategory(context),
      splashColor: Colors.black,
      borderRadius: BorderRadius.circular(15),
      child: Container(
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
          // image: DecorationImage(
          //   image: AssetImage(imgPath),
          //   fit: BoxFit.fill,
          // ),
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}
