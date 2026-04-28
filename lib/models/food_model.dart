class FoodModel {
  final String name;
  final String image;
  final String price;
  final String description;

  FoodModel({
    required this.name,
    required this.image,
    required this.price,
    this.description = "Deskripsi makanan lezat yang menggugah selera.",
  });
}
