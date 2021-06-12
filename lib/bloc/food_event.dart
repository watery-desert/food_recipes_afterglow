part of 'food_bloc.dart';

abstract class FoodEvent extends Equatable {
  const FoodEvent();

  @override
  List<Object> get props => [];
}


class LoadFoods extends FoodEvent {}

class FoodsUpated extends FoodEvent {
  final List<Food> foods;

  FoodsUpated(this.foods);

  @override
  List<Object> get props => [foods];
}
