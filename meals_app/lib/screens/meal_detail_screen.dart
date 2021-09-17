import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MealDetailSCreen extends StatelessWidget {
  static const routeName = "/meal-detail";
  final void Function(String) _toggleFavorite;
  final bool Function(String) _isFavorite;
  MealDetailSCreen(this._toggleFavorite,this._isFavorite);


  Widget buildSectionTitle(String text, BuildContext context) {

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(dynamic height, Widget widget,
      {Color color = Colors.black}) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color, width: 1)),
      height: height,
      width: 300,
      child: widget,
    );
  }

  Widget buildBody(
      MediaQueryData mediaQuery, Meal selectedMeal, BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.3,
              width: double.infinity,
              child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover),
            ),
            Container(
              height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.3,
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
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.arrow_back),
                color: Colors.white,
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Container(
                width: mediaQuery.size.width*0.75,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Text(
                  "${selectedMeal.title}",
                  softWrap: true,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, -7),
              spreadRadius: 3,
              blurRadius: 7,
            )
          ]),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.fastfood_rounded),
                  SizedBox(
                    width: 10,
                  ),
                  buildSectionTitle('Ingredients', context),
                ],
              ),
              buildContainer(
                (mediaQuery.size.height - mediaQuery.padding.top) * 0.4,
                ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "${selectedMeal.ingredients[index]}",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                    );
                  },
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildPanel(BuildContext context, MediaQueryData mediaQuery,
      Meal selectedMeal, String mealId) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 40,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.view_headline,
                  color: Colors.black45,
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Steps",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 24,
                        fontFamily: 'RobotoCondensed',
                        fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                buildContainer(
                    (mediaQuery.size.height - mediaQuery.padding.top) * 0.6,
                    ListView.builder(
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                child: Text(
                                  '${index + 1}',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                backgroundColor: Theme.of(context).primaryColor,
                              ),
                              title: Text(
                                "${selectedMeal.steps[index]}",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            Divider(),
                          ],
                        );
                      },
                      itemCount: selectedMeal.steps.length,
                    ),
                    color: Colors.black),
                SizedBox(height: 20,),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final mealId = arguments['id'];
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    final mediaQuery = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.transparent,
            onPressed: ()=>_toggleFavorite(mealId!),
            child: _isFavorite(mealId!)?Icon(Icons.favorite,color: Colors.red,):Icon(Icons.favorite_border,color: Colors.white,),
          ),
          backgroundColor: Colors.white,
          body: SlidingUpPanel(
            backdropEnabled: true,
            parallaxEnabled: true,
            parallaxOffset: .5,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18.0),
                topRight: Radius.circular(18.0)),
            maxHeight: (mediaQuery.size.height - mediaQuery.padding.top) * 0.9,
            body: buildBody(mediaQuery, selectedMeal, context),
            panel: buildPanel(context, mediaQuery, selectedMeal, mealId),
          )),
    );
  }
}
