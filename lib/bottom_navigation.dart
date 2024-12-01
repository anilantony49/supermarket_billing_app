import 'package:flutter/material.dart';
import 'package:machine_task_atts/Utils/colors.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, blurRadius: 3, offset: Offset(0, -2))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            kIconButton(
              index: 0,
              context: context,
              assetImage: "assets/img/store_tab.png",
              label: 'Shop',
            ),
            kIconButton(
              index: 1,
              context: context,
              assetImage: "assets/img/cart_tab.png",
              label: 'Cart',
            )
          ],
        ));
  }

  Widget kIconButton({
    required int index,
    required BuildContext context,
    required String assetImage,
    required String label,
  }) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifier,
      builder: (context, currentIndex, child) {
        final isSelected = currentIndex == index;
        return IconButton(
          enableFeedback: false,
          onPressed: () {
            indexChangeNotifier.value = index;
            FocusScope.of(context).unfocus();
          },
          icon: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                assetImage,
                height: 25,
                width: 25,
                color: isSelected ? Appcolor.primary : Appcolor.primaryText,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: isSelected ? Appcolor.primary : Appcolor.primaryText,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
