import 'package:flutter/material.dart';
import 'package:machine_task_atts/Utils/colors.dart';
import 'package:machine_task_atts/widgets/image_cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            child: ListView.separated(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                itemBuilder: (context, index) {
                  return const ImageCart();
                },
                separatorBuilder: (context, index) => const Divider(
                      color: Colors.black26,
                      height: 1,
                    ),
                itemCount: 5),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  onPressed: () {
                    // showCheckout();
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
                        child: const Text(
                          "\$10.96",
                          style: TextStyle(
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
      ),
    );
  }
}
