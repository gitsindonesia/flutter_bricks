import 'package:flutter/material.dart';
import 'package:flutter_bricks/blocs/meal/meal_bloc.dart';
import 'package:flutter_bricks/globals/widgets/loading_indicator.dart';
import 'package:flutter_bricks/models/meal/meal.dart';
import 'package:flutter_bricks/repositories/meal_repository.dart';

class MealScreen extends StatefulWidget{
  final Meal meal;

  const MealScreen({Key key, @required this.meal}) : super(key: key);

  @override
  State<MealScreen> createState() => _MealScreen();
}

class _MealScreen extends State<MealScreen>{

  final MealBloc mealBloc = MealBloc(mealRepository: MealRepository());

  MealState mealState;
  Meal meal;

  @override
  void initState() {
    meal = widget.meal;
    mealBloc.dispatch(FetchOneMeal(meal.idMeal));
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
      setState((){
        mealState = state;
        if(state is MealLoaded){
          meal = state.meal;
        }
      });

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text("${meal.strMeal}"),
            expandedHeight: 250.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: "meal-${meal.idMeal}",
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(meal.strMealThumb),
                        fit: BoxFit.cover
                    )
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    if(mealState is MealLoaded)...[
                      Text(meal.strInstructions)
                    ],
                    if(mealState is MealLoading)...[
                      LoadingIndicator()
                    ]
                  ],
                ),
              ),

            ]),
          ),
        ],
      ),
    );

  }

}