import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class MealState extends Equatable {
  MealState([List props = const []]) : super(props);
}

class MealInitial extends MealState {
  @override
  String toString() => 'MealInitial{}';
}

class MealLoading extends MealState {
  @override
  String toString() => 'MealLoading{}';
}

class MealLoaded extends MealState {
  final meal;

  MealLoaded(this.meal): super([meal]);

  @override
  String toString() => 'MealLoaded{${meal.toString()}}';
}

class MealNoResult extends MealState {
  final String error;

  MealNoResult({@required this.error}) : super([error]);

  @override
  String toString() => 'MealNoResult { error: $error }';
}

class MealForbid extends MealState {
  final String error;

  MealForbid({@required this.error}) : super([error]);

  @override
  String toString() => 'MealForbid { error: $error }';
}

class MealFailure extends MealState {
  final String error;

  MealFailure({@required this.error}) : super([error]);

  @override
  String toString() => 'MealFailure { error: $error }';
}