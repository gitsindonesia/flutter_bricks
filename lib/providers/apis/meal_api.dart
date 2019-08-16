import 'package:flutter_bricks/globals/exception.dart';
import 'package:flutter_bricks/globals/helpers/log_http_interceptor.dart';
import 'package:flutter_bricks/globals/helpers/rest_api.dart';
import 'package:flutter_bricks/models/meal/meal.dart';
import 'package:http_interceptor/http_with_interceptor.dart';


class MealAPIProvider{

  final baseUrl = "https://www.themealdb.com/api/json/v1/1/";

  final http = HttpWithInterceptor.build(
      interceptors: [LogHttpInterceptor()]);

  Future<List<Meal>> fetchMeals() async{
    final url = baseUrl + "latest.php";
    final response = await http.get(url);
    return RestAPI.responseJSON(response,
        onHttpOk: (json){
          if (json['meals'] == null) throw NoResultException();
          List<Meal> meals = new List<Meal>();
          json['meals'].forEach((v) => meals.add(new Meal.fromJson(v)));
          return meals;
        }
    );
  }

  Future<Meal> fetchMeal(String id) async{
    final url = baseUrl + "lookup.php?i=$id";
    final response = await http.get(url);
    return RestAPI.responseJSON(response,
        onHttpOk: (json){
          if (json['meals'] == null) throw NoResultException();
          List<Meal> meals = new List<Meal>();
          json['meals'].forEach((v) => meals.add(new Meal.fromJson(v)));
          return meals[0];
        }
    );
  }
}