import 'package:flutter/material.dart';
import 'package:machine_task_atts/db/cart_db.dart';
import 'package:machine_task_atts/estimate_view.dart';
import 'package:machine_task_atts/models/cart_models.dart';
import 'package:machine_task_atts/widgets/round_button.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  List<CartModels> items = [];

  @override
  void initState() {
    super.initState();
    fetchItems();
  }

  void fetchItems() async {
    List<CartModels> fetchedItems = await CartDb.singleton.getCart();
    setState(() {
      items = fetchedItems;
    });
  }

  // Reusable method to create TableCell widgets with consistent style
  Widget _buildTableCell(String text,
      {double fontSize = 14,
      FontWeight fontWeight = FontWeight.bold,
      TextAlign textAlign = TextAlign.center}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        textAlign: textAlign,
        style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Checkout',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          // Table Header
          Table(
            border: TableBorder.all(color: Colors.black26),
            children: [
              TableRow(
                decoration: BoxDecoration(color: Colors.grey[200]),
                children: [
                  _buildTableCell('No'),
                  _buildTableCell('Name'),
                  _buildTableCell('Price'),
                  _buildTableCell('Qty'),
                  _buildTableCell('Disc'),
                  _buildTableCell('Amount'),
                ],
              ),
            ],
          ),
          // Table Body: List of items
          Table(
            border: TableBorder.all(color: Colors.black12),
            children: items.map((item) {
              int index = items.indexOf(item);

              // Parse price, quantity, and discount to numeric types
              double price = double.tryParse(item.price) ?? 0.0;
              int quantity = int.tryParse(item.quantity) ?? 0;
              double discount = double.tryParse(item.discount ?? '0') ?? 0.0;

              // Calculate total price
              double totalPrice = (price * quantity) - discount;

              return TableRow(
                children: [
                  _buildTableCell('${index + 1}', fontSize: 14, fontWeight: FontWeight.w400),
                  _buildTableCell(item.title, fontSize: 14, fontWeight: FontWeight.w400),
                  _buildTableCell(item.price, fontSize: 14, fontWeight: FontWeight.w400),
                  _buildTableCell(item.quantity, fontSize: 14, fontWeight: FontWeight.w400),
                  _buildTableCell(item.discount.toString(), fontSize: 14, fontWeight: FontWeight.w400),
                  _buildTableCell('$totalPrice', fontSize: 14, fontWeight: FontWeight.w400),
                ],
              );
            }).toList(),
          ),
          const SizedBox(height: 15),
          RoundButton(
            title: "Place Order",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EstimateView()),
              );
            },
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
