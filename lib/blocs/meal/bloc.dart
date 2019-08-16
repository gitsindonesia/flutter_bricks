import 'dart:async';

import 'package:flutter_bricks/globals/exception.dart';
import 'package:flutter_bricks/models/meal/meal.dart';
import 'package:flutter_bricks/repositories/meal_repository.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'event.dart';
import 'state.dart';

class MealBloc extends Bloc<MealEvent, MealState> {
  final MealRepository mealRepository;

  MealBloc({
    @required this.mealRepository,
  })  : assert(mealRepository != null);
  MealState get initialState => MealInitial();

  @override
  Stream<MealState> mapEventToState(MealEvent event) async* {
    yield MealLoading();
    try{

      if (event is FetchMeals) yield* _loadMeals();
      if (event is FetchOneMeal) yield* _loadOneMeal(event.id);
    
    } on UnAuthorizeException catch(error){
      yield MealForbid(error: error.message);
    } on NoResultException catch(error){
      yield MealNoResult(error: error.message);
    }catch(error){
      yield MealFailure(error: error.message);
    }
    
  }

  Stream<MealState> _loadMeals() async*{
    List<Meal> meals = await mealRepository.getMeals();
    yield MealLoaded(meals);
  }

  Stream<MealState> _loadOneMeal(String id) async*{
    Meal meal = await mealRepository.getMeal(id);
    yield MealLoaded(meal);
  }
}