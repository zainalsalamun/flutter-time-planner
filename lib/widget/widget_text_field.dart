import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_planner/theme/theme.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController TEC;
  final String hint;
  final TextInputType textInputType;
  final bool isPassword;
  final int maxLines;
  const CustomTextField(
      {required this.TEC,
      required this.hint,
      required this.textInputType,
      this.isPassword = false,
      required this.maxLines,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: getDefaultTextStyle.copyWith(
        color: Get.isDarkMode ? darkPrimaryColor : blackColor,
      ),
      cursorColor: Get.theme.colorScheme.primary,
      controller: TEC,
      maxLines: maxLines,
      obscureText: isPassword,
      keyboardType: textInputType,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: getDefaultTextStyle.copyWith(
            color: Get.isDarkMode
                ? darkPrimaryColor.withOpacity(.6)
                : blackColor.withOpacity(.6),
          ),
          border: OutlineInputBorder(
            borderSide: Divider.createBorderSide(
              context,
              color: greyColor,
              width: .5,
            ),
            borderRadius: BorderRadius.circular(7),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: Divider.createBorderSide(
              context,
              color: Get.theme.colorScheme.primary,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(7),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                Divider.createBorderSide(context, color: greyColor, width: .5),
          ),
          fillColor: greyColor.withOpacity(.1),
          filled: true,
          contentPadding: const EdgeInsets.all(10)),
    );
  }
}
