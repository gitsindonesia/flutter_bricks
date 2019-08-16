import 'package:equatable/equatable.dart';

abstract class MealEvent extends Equatable {
  MealEvent([List props = const []]) : super(props);
}

class FetchMeals extends MealEvent {

  @override
  String toString() => 'FetchMeals{}';
}

class FetchOneMeal extends MealEvent {

  final String id;

  FetchOneMeal(this.id): super([id]);

  @override
  String toString() => 'FetchOneMeal{}';
}