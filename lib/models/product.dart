import 'package:ecommrce/models/categroy.dart';

class Product {
  late int id;
  late String title;
  late String description;
  late double price;
  late List<String> images;
  late String creationAt;
  late String updatedAt;
  late Category category;

  Product({
    required this.category,
    required this.id,
    required this.description,
    required this.title,
    required this.price,
    required this.images,
    required this.creationAt,
    required this.updatedAt,
  });
}
