import 'package:flutter/material.dart';
import 'package:flutter_bricks/blocs/meal/meal_bloc.dart';
import 'package:flutter_bricks/models/meal/meal.dart';
import 'package:flutter_bricks/repositories/meal_repository.dart';
import 'package:flutter_bricks/screens/meal/meal_screen.dart';

@optionalTypeArgs
mixin HomeScreenExt<T extends StatefulWidget> on State<T>{

  final MealBloc mealBloc = MealBloc(mealRepository: MealRepository());

  MealState mealState;
  
  @override
  void initState() {
    mealBloc.dispatch(FetchMeals());
    blocListener();
    super.initState();
  }

  @override
  void dispose() {
    mealBloc.dispose();
    super.dispose();
  }

  void blocListener(){
    mealBloc.state.listen((state){
      setState(() => mealState = state);
    });
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