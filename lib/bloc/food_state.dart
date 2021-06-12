part of 'food_bloc.dart';

abstract class FoodState extends Equatable {
  const FoodState();
  
  @override
  List<Object> get props => [];
}

class FoodsLoading extends FoodState {}

class FoodsLoaded extends FoodState {
  final List<Food> foods;
  FoodsLoaded(this.foods);

  @override
  List<Object> get props => [foods];
}

