import 'package:equatable/equatable.dart';

class Food extends Equatable {
  final String imageLink;
  final double price;
  final String foodName;

  Food._({
    required this.imageLink,
    required this.price,
    required this.foodName,
  });

  factory Food.fromMap(Map<String, dynamic> data) {
    return Food._(
      imageLink: data['image'],
      price: data['price'],
      foodName: data['name'],
    );
  }

  @override
  List<Object> get props => [imageLink, price];
}
