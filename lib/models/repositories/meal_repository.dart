import 'dart:convert';

import 'package:flutter_bricks/globals/exception.dart';
import 'package:flutter_bricks/models/daos/meal.dart';
import 'package:http/http.dart' as http;

class MealRepository {
  
  final getMealsUrl = "https://www.themealdb.com/api/json/v1/1/latest.php";

  Future<List<Meal>> getMeals() async{
    final response = await http.get(getMealsUrl);
    final json = jsonDecode(response.body);

    if (json['meals'] == null) throw NoResultException();
    
    switch(response.statusCode){
      case 404:
        throw Exception("Not Found Url");
        break;
      case 400:
        throw Exception("Bad Request");
        break;
      case 401:
        throw UnAuthorizeException();
        break;
      default:
        List<Meal> meals = new List<Meal>();
        json['meals'].forEach((v) {
          meals.add(new Meal.fromJson(v));
        });

      return meals;
    }
  }

}