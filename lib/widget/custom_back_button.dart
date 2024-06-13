// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

CustomBackButton() {
  return IconButton(
      onPressed: () {
        Get.back();
      },
      icon: Icon(
        FontAwesomeIcons.arrowLeft,
        size: 15,
        color: Get.isDarkMode ? Colors.white : Colors.black,
      ));
}
