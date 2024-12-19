import 'package:flutter/material.dart';
import 'package:machine_task_atts/utils/text.dart';
import 'package:machine_task_atts/db/cart_db.dart';

class CartActions {
  static void removeItemsAndShowSnackbar(BuildContext context, String itemId) {
    CartDb.singleton.removeCart(itemId);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppText.itemRemovedText),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
