import 'package:flutter/material.dart';
import 'package:flutter_bricks/blocs/meal/meal_bloc.dart';
import 'package:flutter_bricks/models/daos/meal.dart';
import 'package:flutter_bricks/models/repositories/meal_repository.dart';
import 'package:flutter_bricks/screens/meal/meal_screen.dart';

@optionalTypeArgs
mixin HomeScreenExt<T extends StatefulWidget> on State<T>{

  final MealBloc mealBloc = MealBloc(mealRepository: MealRepository());
  
  @override
  void initState() {
    mealBloc.dispatch(FetchMeals());
    super.initState();
  }

  void onMealItemTap(Meal meal){
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) {
            return MealScreen(meal: meal);
          }
        )
      );
  }
  
}