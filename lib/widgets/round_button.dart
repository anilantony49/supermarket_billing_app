import 'package:flutter/material.dart';
import 'package:machine_task_atts/Utils/colors.dart';




class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const RoundButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: 60,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(19)),
      minWidth: double.maxFinite,
      elevation: 0.1,
      color: Appcolor.primary,
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final String title;
  final String icon;
  final Color bgColor;
  final VoidCallback onPressed;
  const RoundIconButton(
      {super.key,
      required this.title,
      required this.icon,
      required this.bgColor,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: 60,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(19)),
      minWidth: double.maxFinite,
      elevation: 0.1,
      color: bgColor,
      child: Row(
        children: [
          
          Image.asset(icon, width: 20, height: 20 ,  fit: BoxFit.contain, ),

          const SizedBox(width: 30,),
          
          Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
