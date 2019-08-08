import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
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
      body: BlocBuilder(
        bloc: mealBloc,
        builder: (BuildContext context, MealState state){
          return ListView(
            children: <Widget>[

              if(state is MealLoaded)...[
                ...state.meals.map((meal) => MealItem(meal: meal, onTap: onMealItemTap,)).toList()
              ],
            
              if(state is MealLoading)...[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: (MediaQuery.of(context).size.height / 3)),
                  child: LoadingIndicator(),
                )
              ],

              if(state is MealNoResult || state is MealFailure)...[
                ErrorAlert(state: state)
              ],
                
            
            ],
          );
        },
      )
    );
  }
}