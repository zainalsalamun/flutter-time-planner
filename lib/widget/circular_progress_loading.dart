import 'package:flutter/material.dart';
import 'package:time_planner/theme/theme.dart';

class CircularProgressLoading extends StatelessWidget {
  const CircularProgressLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          color: whiteColor,
        ),
      ),
    );
  }
}
