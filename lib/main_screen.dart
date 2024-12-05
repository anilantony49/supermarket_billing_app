import 'package:flutter/material.dart';
import 'package:machine_task_atts/bottom_navigation.dart';
import 'package:machine_task_atts/cart/cart_screen.dart';
import 'package:machine_task_atts/db/cart_db.dart';
import 'package:machine_task_atts/home/home_screen.dart';
import 'package:machine_task_atts/models/cart_models.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> pages = [];
  @override
  void initState() {
       fetchItems();
    pages = [const HomeScreen(), const CartScreen()];

    super.initState();
  }
    void fetchItems() async {
    List<CartModels> fetchedItems = await CartDb.singleton.getCart();
    setState(() {
      items = fetchedItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, int index, child) {
            return IndexedStack(
              index: index,
              children: pages,
            );
          }),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
