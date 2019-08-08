import 'package:flutter/material.dart';
import 'package:flutter_bricks/models/daos/meal.dart';

class MealScreen extends StatelessWidget{

  final Meal meal;

  const MealScreen({Key key, @required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("${meal.strMeal}"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: "meal-${meal.idMeal}",
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(meal.strMealThumb, width: 200,height: 200),
              ),
            ),
            SizedBox(height: 30),
            Text("${meal.strMeal}"),
          ]
        ),
      ),
    );
  }

}