import 'food_model.dart';

class RestaurantModel {
  final String name;
  final String image;
  final String distance;
  final double rating;
  final List<FoodModel> menu;

  RestaurantModel({
    required this.name,
    required this.image,
    required this.distance,
    required this.rating,
    required this.menu,
  });
}
