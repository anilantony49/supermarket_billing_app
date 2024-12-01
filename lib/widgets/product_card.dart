import 'package:flutter/material.dart';
import 'package:machine_task_atts/Utils/colors.dart';
import 'package:machine_task_atts/db/cart_db.dart';
import 'package:machine_task_atts/models/cart_models.dart';

class ProductCard extends StatefulWidget {
  final Map<String, String> product;
  final Function(String) onRemove;
  const ProductCard({super.key, required this.product, required this.onRemove});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isInCart = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        // height: 280,
        width: 180,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              color: Appcolor.placeholder.withOpacity(0.5), width: 1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  widget.product["icon"]!,
                  width: 100,
                  height: 80,
                  fit: BoxFit.contain,
                ),
              ],
            ),
            const Spacer(),
            Text(
              widget.product["name"]!,
              style: TextStyle(
                  color: Appcolor.primaryText,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              "${widget.product["qty"]}${widget.product["unit"]}",
              style: TextStyle(
                  color: Appcolor.secondaryText,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.product["price"]!,
                  style: TextStyle(
                      color: Appcolor.primaryText,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                InkWell(
                  onTap: () async {
                    if (isInCart) {
                      widget.onRemove(
                          DateTime.now().millisecondsSinceEpoch.toString());
                      setState(() => isInCart = false);
                    } else {
                      final item = CartModels(
                        id: DateTime.now().millisecondsSinceEpoch.toString(),
                        title: widget.product["name"]!,
                        price: widget.product["price"]!,
                        quantity:
                            "${widget.product["qty"]}${widget.product["unit"]}",
                        image: widget.product["icon"]!,
                      );

                      await CartDb.singleton.addCart(item);
                      setState(() {
                        isInCart = true;
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Item added to the cart'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  child: Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: Appcolor.primary,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      isInCart ? Icons.check : Icons.add,
                      color: Colors.white,
                      size: 20, // Adjust size as needed
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
