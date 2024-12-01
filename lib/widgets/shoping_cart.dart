// import 'package:flutter/material.dart';
// import 'package:machine_task_atts/Utils/colors.dart';
// import 'image_cart.dart'; // Assume the ImageCart widget is in this file

// class ShoppingCart extends StatefulWidget {
//   @override
//   _ShoppingCartState createState() => _ShoppingCartState();
// }

// class _ShoppingCartState extends State<ShoppingCart> {
//   double totalPrice = 0.0; // Tracks total price of all items

//   // Callback to update total price
//   void updateTotalPrice(double itemTotal, {bool isAdd = true}) {
//     setState(() {
//       totalPrice += isAdd ? itemTotal : -itemTotal;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Shopping Cart'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView(
//               children: [
//                 ImageCart(
//                   title: "Item 1",
//                   basePrice: 20.0,
//                   initialQuantity: 1,
//                   image: "assets/img/sample.png",
//                   onRemove: () {
//                     // Handle item removal
//                   },
//                   onPriceChange: updateTotalPrice,
//                 ),
//                 ImageCart(
//                   title: "Item 2",
//                   basePrice: 15.0,
//                   initialQuantity: 2,
//                   image: "assets/img/sample2.png",
//                   onRemove: () {
//                     // Handle item removal
//                   },
//                   onPriceChange: updateTotalPrice,
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.all(16.0),
//             color: Colors.white,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Total: \$${totalPrice.toStringAsFixed(2)}",
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Appcolor.primaryText,
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle checkout logic
//                   },
//                   child: const Text("Go to Checkout"),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
