import 'package:hive_flutter/hive_flutter.dart';
part 'cart_models.g.dart';

@HiveType(typeId: 1)
class CartModels {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String price;
  @HiveField(3)
  final String quantity;
  @HiveField(4)
  final String image;

  CartModels(
      {required this.id,
      required this.title,
      required this.price,
      required this.quantity,
      required this.image});
}
