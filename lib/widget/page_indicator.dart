import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/theme.dart';

class PageIndicator extends StatelessWidget {
  final indicatorPosition;
  final currentPageIndex;
  const PageIndicator(
      {Key? key,
      required this.indicatorPosition,
      required this.currentPageIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 10,
      width: currentPageIndex == indicatorPosition ? 15 : 10,
      decoration: BoxDecoration(
        color: currentPageIndex == indicatorPosition
            ? Get.theme.colorScheme.primary
            : greyColor,
        borderRadius: BorderRadius.circular(10),
      ),
      duration: const Duration(milliseconds: 400),
    );
  }
}
