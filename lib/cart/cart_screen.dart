import 'package:flutter/material.dart';
import 'package:machine_task_atts/Utils/colors.dart';
import 'package:machine_task_atts/cart/widgets/show_check_out.dart';
import 'package:machine_task_atts/db/cart_db.dart';
import 'package:machine_task_atts/models/cart_models.dart';
import 'package:machine_task_atts/widgets/image_cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  // void fetchItems() async {

  @override
  Widget build(BuildContext context) {
    void removeItmesAndShowSnackbar(String itemId) {
      CartDb.singleton.removeCart(itemId);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Item Removed from cart'),
          duration: Duration(seconds: 2),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
        title: Text(
          "My Cart",
          style: TextStyle(
              color: Appcolor.primaryText,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
      ),
      backgroundColor: Colors.white,
      body: ValueListenableBuilder(
        valueListenable: CartDb().cartNotifier,
        builder: (BuildContext context, List<CartModels> newItem, Widget? _) {
          // calculate total amount
          final double totalAmount = newItem.fold(
              0.0,
              (sum, item) =>
                  sum + (double.parse(item.price) * int.parse(item.quantity)));
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                child: ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  itemBuilder: (context, index) {
                    // Get item data
                    final item = newItem[index];
                    return ImageCart(
                      initialQuantity: int.parse(item.quantity),
                      title: item.title,
                      basePrice: double.parse(item.price),
                      image: item.image,
                      onRemove: () => removeItmesAndShowSnackbar(item.id),
                      unit: item.unit,
                      id: item.id,
                      discount: item.discount,
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(
                    color: Colors.black26,
                    height: 1,
                  ),
                  itemCount: newItem.length,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        showCheckout(context);
                      },
                      height: 60,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19)),
                      minWidth: double.maxFinite,
                      elevation: 0.1,
                      color: Appcolor.primary,
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Go to Checkout",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8),
                            child: Text(
                              "\$${totalAmount.toStringAsFixed(2)}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
