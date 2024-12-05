  import 'package:flutter/material.dart';
import 'package:machine_task_atts/Utils/colors.dart';

Widget buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          "assets/img/location.png",
          width: 16,
          height: 16,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          "Cochin, Kerala",
          style: TextStyle(
              color: Appcolor.darkGray,
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
        const Spacer(),
        // const SizedBox(
        //   width:58,
        // ),
        ClipOval(
          child: Image.asset("assets/img/profile picture.webp",
              width: 55, height: 55, fit: BoxFit.cover),
        ),
      ],
    );
  }
