import 'package:flutter/material.dart';
import 'package:machine_task_atts/db/cart_db.dart';

class CartActions {
  static void removeItemsAndShowSnackbar(BuildContext context, String itemId) {
    CartDb.singleton.removeCart(itemId);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Item Removed from cart'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
  