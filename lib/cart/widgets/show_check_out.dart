  import 'package:flutter/material.dart';
import 'package:machine_task_atts/checkout_screen.dart';

void showCheckout(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isDismissible: false,
        context: context,
        builder: (context) {
          return const CheckoutScreen();
        });
  }