import '../model/food.dart';
import '../data/data.dart';
export '../model/food.dart';

class FoodRepo {
  Stream<List<Food>> streamFood() {
    final result = DataLayer().getData().map(
          (event) => event
              .map(
                (rawMap) => Food.fromMap(rawMap),
              )
              .toList(),
        );
    return result;
  }
}
