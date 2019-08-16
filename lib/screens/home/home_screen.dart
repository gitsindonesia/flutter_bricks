import 'package:flutter/material.dart';

import 'package:flutter_bricks/blocs/meal/meal_bloc.dart';
import 'package:flutter_bricks/globals/widgets/loading_indicator.dart';
import 'package:flutter_bricks/screens/home/extensions/home_screen_ext.dart';
import 'package:flutter_bricks/screens/home/widgets/error_alert.dart';
import 'package:flutter_bricks/screens/home/widgets/meal_item.dart';



class HomeScreen extends StatefulWidget{
  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> with HomeScreenExt{
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView(
        children: <Widget>[

          if(mealState is MealLoaded)...[
            ...(mealState as MealLoaded).meal.map((meal) => MealItem(meal: meal, onTap: onMealItemTap)).toList()
          ],

          if(mealState is MealLoading)...[
            Padding(
              padding: EdgeInsets.symmetric(vertical: (MediaQuery.of(context).size.height / 3)),
              child: LoadingIndicator(),
            )
          ],

          if(mealState is MealNoResult || mealState is MealFailure)...[
            ErrorAlert(state: mealState)
          ],


        ],
      )
    );
  }
}