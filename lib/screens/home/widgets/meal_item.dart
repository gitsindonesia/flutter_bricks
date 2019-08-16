

import 'package:flutter/material.dart';
import 'package:flutter_bricks/models/meal/meal.dart';

class MealItem extends StatelessWidget{

  final Meal meal;
  final Function onTap;

  const MealItem({Key key, this.meal, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Material(
        color: Colors.white,
        elevation: 1,
        child: InkWell(
          onTap: (){
            onTap(meal);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Hero(
                  tag: "meal-${meal.idMeal}",
                  child: Image.network(meal.strMealThumb),
                )
              ) ,
              title: Text(meal.strMeal),
            ),
          ),
        ),
      ),
    );
  }

}