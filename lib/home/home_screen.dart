import 'dart:async';

import 'package:flutter/material.dart';
import 'package:machine_task_atts/db/cart_db.dart';
import 'package:machine_task_atts/models/cart_models.dart';
import 'package:machine_task_atts/widgets/product_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../Utils/colors.dart';
import '../widgets/section_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List listArr = [
    {
      "name": "Apple",
      "icon": "assets/img/apple_red.png",
      "qty": "1",
      "unit": "kg, Prices",
      "price": "\$4.99"
    },
    {
      "name": "Rice",
      "icon": "assets/img/rice.png",
      "qty": "1",
      "unit": "kg, Prices",
      "price": "\$4.99"
    },
    {
      "name": "Rice2",
      "icon": "assets/img/rice.png",
      "qty": "1",
      "unit": "kg, Prices",
      "price": "\$4.99"
    },
    {
      "name": "Rice3",
      "icon": "assets/img/rice.png",
      "qty": "1",
      "unit": "kg, Prices",
      "price": "\$4.99"
    }
  ];
  List<CartModels> items = [];

  @override
  void initState() {
    fetchItems();
    super.initState();
    // Automatically change pages every 3 seconds
    // Timer.periodic(const Duration(seconds: 3), (timer) {
    //   if (_pageController.hasClients) {
    //     _currentPage = (_currentPage + 1) % 4;
    //     _pageController.animateToPage(
    //       _currentPage,
    //       duration: const Duration(milliseconds: 300),
    //       curve: Curves.easeInOut,
    //     );
    //   }
    // });
  }

  void fetchItems() async {
    List<CartModels> fetchedItems = await CartDb.singleton.getCart();
    setState(() {
      items = fetchedItems;
    });
  }

  void removeItmesAndShowSnackbar(String itemId) {
    CartDb.singleton.removeCart(itemId);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Removed from cart'),
        duration: Duration(seconds: 2),
      ),
    );

    fetchItems();
  }

  bool isInCart = false;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController txtSearch = TextEditingController();
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Image.asset(
              //       "assets/img/location.png",
              //       width: 16,
              //       height: 16,
              //     ),
              //     const SizedBox(
              //       width: 8,
              //     ),
              //     Text(
              //       "Cochin, Kerala",
              //       style: TextStyle(
              //           color: Appcolor.darkGray,
              //           fontSize: 18,
              //           fontWeight: FontWeight.w600),
              //     ),
              //     const Spacer(),
              //     // const SizedBox(
              //     //   width:58,
              //     // ),
              //     ClipOval(
              //       child: Image.asset("assets/img/profile picture.webp",
              //           width: 55, height: 55, fit: BoxFit.cover),
              //     ),
              //   ],
              // ),
              // const SizedBox(
              //   height: 15,
              // ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20),
              //   child: Container(
              //     height: 52,
              //     decoration: BoxDecoration(
              //         color: const Color(0xffF2F3F2),
              //         borderRadius: BorderRadius.circular(15)),
              //     alignment: Alignment.center,
              //     child: TextField(
              //       controller: txtSearch,
              //       decoration: InputDecoration(
              //         contentPadding: const EdgeInsets.symmetric(vertical: 16),
              //         prefixIcon: Padding(
              //           padding: const EdgeInsets.all(13.0),
              //           child: Image.asset(
              //             "assets/img/search.png",
              //             width: 20,
              //             height: 20,
              //           ),
              //         ),
              //         border: InputBorder.none,
              //         enabledBorder: InputBorder.none,
              //         focusedBorder: InputBorder.none,
              //         hintText: "Search Store",
              //         hintStyle: TextStyle(
              //             color: Appcolor.secondaryText,
              //             fontSize: 14,
              //             fontWeight: FontWeight.w600),
              //       ),
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   height: 15,
              // ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20),
              //   child: Container(
              //     width: double.maxFinite,
              //     height: 135,
              //     decoration: BoxDecoration(
              //         color: const Color(0xffF2F3F2),
              //         borderRadius: BorderRadius.circular(15)),
              //     alignment: Alignment.center,
              //     child: ClipRRect(
              //       borderRadius: BorderRadius.circular(15),
              //       child: PageView(
              //         controller: _pageController,
              //         children: [
              //           Image.asset(
              //             "assets/img/banner1.jpeg",
              //             fit: BoxFit.cover,
              //           ),
              //           Image.asset(
              //             "assets/img/banner2.jpg",
              //             fit: BoxFit.cover,
              //           ),
              //           Image.asset(
              //             "assets/img/banner3.jpg",
              //             fit: BoxFit.cover,
              //           ),
              //           Image.asset(
              //             "assets/img/banner4.jpg",
              //             fit: BoxFit.cover,
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // const SizedBox(height: 10),
              // SmoothPageIndicator(
              //   controller: _pageController,
              //   count: 4,
              //   effect: ExpandingDotsEffect(
              //     activeDotColor: Appcolor.primary,
              //     dotColor: Appcolor.secondaryText,
              //     dotHeight: 8,
              //     dotWidth: 8,
              //     expansionFactor: 2,
              //   ),
              // ),
              // SectionView(
              //   title: "Groceries",
              //   padding:
              //       const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              //   onPressed: () {},
              // ),
              // const SizedBox(
              //   height: 15,
              // ),
              GridView.builder(
                shrinkWrap: true, // Let GridView size itself to content
                physics: const NeverScrollableScrollPhysics(),
                // scrollDirection: Axis.vertical, // Allows vertical scrolling
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two items per row
                  mainAxisSpacing: 10, // Vertical spacing between rows
                  crossAxisSpacing: 10, // Horizontal spacing between columns
                  // childAspectRatio:
                  //     1.1, // Adjusts the width-to-height ratio of grid items
                ),
                itemCount: 4, // Total number of items
                itemBuilder: (context, index) {
                  var product = listArr[index];
                  return InkWell(
                    child: Container(
                      // height: 280,
                      width: 180,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Appcolor.placeholder.withOpacity(0.5),
                            width: 1),
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
                              InkWell(
                                onTap: () async {
                                  // Check if the item is already in the cart
                                  final itemInCart = items.any((cartItem) =>
                                      cartItem.title == product["name"]);

                                  if (itemInCart) {
                                    // If the item exists, remove it from the cart
                                    final cartItem = items.firstWhere(
                                        (cartItem) =>
                                            cartItem.title == product["name"]);
                                    await CartDb.singleton
                                        .removeCart(cartItem.id);

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text('Item removed from the cart'),
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                  } else {
                                    // If the item does not exist, add it to the cart
                                    final newItem = CartModels(
                                      id: DateTime.now()
                                          .millisecondsSinceEpoch
                                          .toString(), // Unique ID
                                      title: product["name"]!,
                                      price: product["price"]!,
                                      quantity:
                                          "${product["qty"]}${product["unit"]}",
                                      image: product["icon"]!,
                                    );

                                    await CartDb.singleton.addCart(newItem);

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Item added to the cart'),
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                  }

                                  // Refresh the cart items and update UI
                                  setState(() {
                                    fetchItems();
                                  });
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
                                    items.any((cartItem) =>
                                            cartItem.title == product["name"])
                                        ? Icons.check // Show tick if in cart
                                        : Icons.add, // Show plus if not in cart
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
                  ); // Grid item widget
                },
              ),
              SectionView(
                title: "Groceries",
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                onPressed: () {},
              ),
              const SizedBox(
                height: 15,
              ),
              // GridView.builder(
              //   shrinkWrap: true, // Let GridView size itself to content
              //   physics: const NeverScrollableScrollPhysics(),
              //   // scrollDirection: Axis.vertical, // Allows vertical scrolling
              //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 2, // Two items per row
              //     mainAxisSpacing: 10, // Vertical spacing between rows
              //     crossAxisSpacing: 10, // Horizontal spacing between columns
              //     // childAspectRatio:
              //     //     1.1, // Adjusts the width-to-height ratio of grid items
              //   ),
              //   itemCount: 4, // Total number of items
              //   itemBuilder: (context, index) {
              //     var product = listArr[index];
              //     return ProductCard(
              //       product: product,
              //       onRemove: (id) => removeItmesAndShowSnackbar(id),
              //     ); // Grid item widget
              //   },
              // ),

              // ProductCard()
            ],
          ),
        )));
  }
}
