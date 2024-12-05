import 'package:flutter/material.dart';
import 'package:machine_task_atts/Utils/colors.dart';
import 'package:machine_task_atts/db/cart_db.dart';
import 'package:machine_task_atts/models/cart_models.dart';

class BuildProductCard extends StatefulWidget {
  final List listArr;
  // final List<CartModels> items;
  // final Function fetchItems;
  const BuildProductCard({
    super.key,
    required this.listArr,
    // required this.items,
    // required this.fetchItems
  });

  @override
  State<BuildProductCard> createState() => _BuildProductCardState();
}

class _BuildProductCardState extends State<BuildProductCard> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        var product = widget.listArr[index];
        return InkWell(
          child: Container(
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
                      product["icon"]!,
                      width: 100,
                      height: 80,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  product["name"]!,
                  style: TextStyle(
                      color: Appcolor.primaryText,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  "${product["qty"]}${product["unit"]}",
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
                      product["price"]!,
                      style: TextStyle(
                          color: Appcolor.primaryText,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    ValueListenableBuilder(
                      valueListenable: CartDb.singleton.cartNotifier,
                      builder: (BuildContext context,
                          List<CartModels> cartItems, Widget? _) {
                        bool isItemInCart = cartItems.any(
                            (cartItem) => cartItem.title == product["name"]);
                        return InkWell(
                          onTap: () async {
                            // Check if the item is already in the cart
                            if (isItemInCart) {
                              // Remove item from cart
                              final cartItem = cartItems.firstWhere(
                                  (cartItem) =>
                                      cartItem.title == product["name"]);
                              await CartDb.singleton.removeCart(cartItem.id);

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Item removed from the cart'),
                                    duration: Duration(seconds: 2)),
                              );
                            } else {
                              // Add item to cart
                              final newItem = CartModels(
                                id: DateTime.now()
                                    .millisecondsSinceEpoch
                                    .toString(),
                                title: product["name"]!,
                                price: product["price"]!,
                                quantity: "${product["qty"]}${product["unit"]}",
                                image: product["icon"]!,
                              );

                              await CartDb.singleton.addCart(newItem);

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Item added to the cart'),
                                    duration: Duration(seconds: 2)),
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
                              isItemInCart ? Icons.check : Icons.add,
                              color: Colors.white,
                              size: 20, // Adjust size as needed
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ); // Grid item widget
      },
    );
  }
}
