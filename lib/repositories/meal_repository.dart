

import 'package:flutter_bricks/models/meal/meal.dart';
import 'package:flutter_bricks/providers/apis/meal_api.dart';

class MealRepository {

  final MealAPIProvider mealAPI = MealAPIProvider();

  Future<List<Meal>> getMeals() async => await mealAPI.fetchMeals();
  Future<Meal> getMeal(String id) async => await mealAPI.fetchMeal(id);
}