import 'package:flutter/material.dart';

class BuildSection extends StatelessWidget {
  final String? firstRowfirstText;
  final String? firstRowSecondText;
  final String? secondRowFirstText;
  final String? secondRowsecondText;
  final double textFont;
  const BuildSection(
      {super.key,
      this.firstRowfirstText,
      this.secondRowsecondText,
      this.firstRowSecondText,
      this.secondRowFirstText,
      required this.textFont});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 90, // Minimum height for the box
        maxHeight: 90, // Maximum height for the box (to mimic fixed height)
      ),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 231, 229, 229), // Background color
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    firstRowfirstText!,
                    style: TextStyle(
                      fontSize: textFont,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    firstRowSecondText!,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    secondRowFirstText!,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    secondRowsecondText!,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
