import 'package:flutter/material.dart';
import 'package:time_planner/theme/theme.dart';

class CustomButtonSosmed extends StatelessWidget {
  final IconData icon;
  final Function? onTap;
  final Color color;
  const CustomButtonSosmed(
      {Key? key, required this.icon, this.onTap, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap!(),
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: color,
        ),
        child: Icon(
          icon,
          color: whiteColor,
        ),
      ),
    );
  }
}
