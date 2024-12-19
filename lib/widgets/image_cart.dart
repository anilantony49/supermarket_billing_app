import 'package:flutter/material.dart';
import 'package:machine_task_atts/utils/colors.dart';
import 'package:machine_task_atts/db/cart_db.dart';
import 'package:machine_task_atts/models/cart_models.dart';

class ImageCart extends StatefulWidget {
  final String id;
  final String title;
  final double basePrice;
  final int initialQuantity;
  final String discount;
  final String unit;
  final String image;
  final VoidCallback onRemove;

  const ImageCart({
    super.key,
    required this.id,
    required this.title,
    required this.basePrice,
    required this.initialQuantity,
    required this.discount,
    required this.unit,
    required this.image,
    required this.onRemove,
  });

  @override
  State<ImageCart> createState() => _ImageCartState();
}

class _ImageCartState extends State<ImageCart> {
  late int quantity;
  late double totalPrice;

  @override
  void initState() {
    super.initState();
    quantity =
        widget.initialQuantity; // Initialize quantity with the passed value
    totalPrice = widget.basePrice * quantity; // Calculate initial total price
  }

  void incrementQuantity() async {
    setState(() {
      quantity++;
      totalPrice = widget.basePrice * quantity; // Update total price
    });
    final updatedItem = CartModels(
        id: widget.id,
        title: widget.title,
        price: widget.basePrice.toStringAsFixed(2),
        quantity: quantity.toString(),
        unit: widget.unit,
        image: widget.image,
        discount: widget.discount);

    await CartDb.singleton.editCart(updatedItem, widget.id);
  }

  void decrementQuantity() async {
    setState(() {
      if (quantity > 1) {
        quantity--;
        totalPrice = widget.basePrice * quantity; // Update total price
      }
    });
    final updatedItem = CartModels(
        id: widget.id,
        title: widget.title,
        price: widget.basePrice.toStringAsFixed(2),
        quantity: quantity.toString(),
        unit: widget.unit,
        image: widget.image,
        discount: widget.discount);

    await CartDb.singleton.editCart(updatedItem, widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: Colors.black.withOpacity(0.6),
                  offset: const Offset(0.0, 10.0),
                  blurRadius: 10.0,
                  spreadRadius: -6.0,
                ),
              ],
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                  // ignore: deprecated_member_use
                  Colors.black.withOpacity(0.35),
                  BlendMode.multiply,
                ),
                image: AssetImage(widget.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.title,
                        style: TextStyle(
                          color: Appcolor.primaryText,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: widget.onRemove,
                      child: Image.asset(
                        "assets/img/close.png",
                        width: 15,
                        height: 15,
                        color: Appcolor.secondaryText,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    InkWell(
                      onTap: decrementQuantity,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Appcolor.placeholder.withOpacity(0.5),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.remove,
                          size: 20,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Row(
                      children: [
                        Text(
                          "$quantity",
                          style: TextStyle(
                            color: Appcolor.primaryText,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          widget.unit,
                          style: TextStyle(
                            color: Appcolor.primaryText,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 15),
                    InkWell(
                      onTap: incrementQuantity,
                      child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Appcolor.placeholder.withOpacity(0.5),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.add,
                            size: 20,
                            color: Colors.green,
                          )),
                    ),
                    const Spacer(),
                    Text(
                      "\$${totalPrice.toStringAsFixed(2)}",
                      style: TextStyle(
                        color: Appcolor.primaryText,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
