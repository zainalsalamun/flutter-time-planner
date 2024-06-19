import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_planner/controllers/introduction_controller.dart';
import 'package:time_planner/theme/theme.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final controller = Get.find<IntroductionController>();

  @override
  Widget build(BuildContext context) {
    controller.triggerSplashScreen();

    return Scaffold(
      backgroundColor: Get.isDarkMode
          ? Get.theme.scaffoldBackgroundColor
          : Get.theme.colorScheme.primary,
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 5,
            ),
            Text(
              "Time Planner",
              style: getBoldTextStyle.copyWith(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
