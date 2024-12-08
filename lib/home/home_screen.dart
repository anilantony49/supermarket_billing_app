import 'dart:async';

import 'package:flutter/material.dart';
import 'package:machine_task_atts/home/widgets/build_banner.dart';
import 'package:machine_task_atts/home/widgets/build_product_card.dart';
import 'package:machine_task_atts/home/widgets/build_search_bar.dart';
import 'package:machine_task_atts/home/widgets/build_title.dart';
import 'package:machine_task_atts/models/cart_models.dart';
import 'package:machine_task_atts/home/widgets/build_header.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../Utils/colors.dart';

List<CartModels> items = [];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController();
  int _currentPage = 0;

  List listArr = [
    {
      "name": "Apple",
      "icon": "assets/img/apple_red.png",
      "qty": "1",
      "unit": "kg",
      "price": "4.99",
      "discount": "2"
    },
    {
      "name": "Rice",
      "icon": "assets/img/rice.png",
      "qty": "1",
      "unit": "kg",
      "price": "4.99",
      "discount": "3"
    },
    {
      "name": "Rice2",
      "icon": "assets/img/rice.png",
      "qty": "1",
      "unit": "kg",
      "discount": "5"
    },
    {
      "name": "Rice3",
      "icon": "assets/img/rice.png",
      "qty": "1",
      "unit": "kg",
      "price": "4.99",
      "discount": "7"
    }
  ];

  @override
  void initState() {
    // fetchItems();
    super.initState();
    // Automatically change pages every 3 seconds
    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (pageController.hasClients) {
        _currentPage = (_currentPage + 1) % 4;
        pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  // void fetchItems() async {
  //   List<CartModels> fetchedItems = await CartDb.singleton.getCart();
  //   setState(() {
  //     items = fetchedItems;
  //   });
  // }

  @override
  void dispose() {
    pageController.dispose();
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
              buildHeader(),
              const SizedBox(
                height: 15,
              ),
              buildSearchBar(txtSearch),
              const SizedBox(
                height: 15,
              ),
              buildBanner(pageController),
              const SizedBox(height: 10),
              SmoothPageIndicator(
                controller: pageController,
                count: 4,
                effect: ExpandingDotsEffect(
                  activeDotColor: Appcolor.primary,
                  dotColor: Appcolor.secondaryText,
                  dotHeight: 8,
                  dotWidth: 8,
                  expansionFactor: 2,
                ),
              ),
              buildTitle(),
              BuildProductCard(
                listArr: listArr,
              ),
              const SizedBox(
                height: 15,
              ),
              buildTitle(),
              const SizedBox(
                height: 15,
              ),
              BuildProductCard(
                listArr: listArr,
              ),
            ],
          ),
        )));
  }
}
