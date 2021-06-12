import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../repository/food_repo.dart';

part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  final FoodRepo _foodRepo;
  StreamSubscription? _foodSub;

  FoodBloc({
    required FoodRepo foodReop,
  })  : _foodRepo = foodReop,
        super(FoodsLoading());

  @override
  Stream<FoodState> mapEventToState(
    FoodEvent event,
  ) async* {
    if (event is LoadFoods) {
      yield* _mapLoadFoodsToState();
    } else if (event is FoodsUpated) {
      yield* _mapFoodsUpatedToState(event);
    }
  }

  Stream<FoodState> _mapLoadFoodsToState() async* {
    _foodSub?.cancel();
    _foodRepo.streamFood().listen((event) {
      add(FoodsUpated(event));
    });
  }

  Stream<FoodState> _mapFoodsUpatedToState(FoodsUpated event) async* {
    await Future.delayed(Duration(seconds: 2));
    yield FoodsLoaded(event.foods);
  }

  @override
  Future<void> close() {
    _foodSub?.cancel();
    return super.close();
  }
}
