import 'package:hive_flutter/hive_flutter.dart';
part 'cart_models.g.dart';

@HiveType(typeId: 1)
class CartModels {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  late final String price;
  @HiveField(3)
  late final String quantity;
  @HiveField(4)
  final String image;
  @HiveField(5)
  final String? discount;

  CartModels(
      {required this.id,
      required this.title,
      required this.price,
      required this.quantity,
      required this.image,
       this.discount});
}
