import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:time_planner/controllers/authentication_module_controller.dart';
import 'package:time_planner/theme/theme.dart';
import 'package:time_planner/widget/custom_back_button.dart';
import 'package:time_planner/widget/widget_text_field.dart';

import '../../widget/social_media_button.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final AuthenticationModuleController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "New User?",
          style: getBoldTextStyle.copyWith(
            color: Get.theme.colorScheme.primary,
          ),
        ),
        leading: CustomBackButton(),
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: Get.height,
        width: Get.width,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create an account",
                style: getBoldTextStyle.copyWith(
                  fontSize: 20,
                  color: Get.theme.primaryColor,
                ),
              ),
              Text(
                "Hi, Please create an account to continue using the app!",
                style: getDefaultTextStyle.copyWith(
                  color:
                      Get.isDarkMode ? greyColor : blackColor.withOpacity(.6),
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              getSignupForm(),
              const SizedBox(
                height: 20,
              ),
              Obx(() {
                return GestureDetector(
                  onTap: controller.onSignupButtonClick,
                  child: Container(
                    height: 55,
                    width: Get.width / 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        7,
                      ),
                      color: Get.theme.colorScheme.primary,
                    ),
                    alignment: Alignment.center,
                    child: controller.showSignupButtonLoadingAnimation.value
                        ? const CircularProgressIndicator()
                        : Text(
                            'Singup',
                            style: getBoldTextStyle.copyWith(
                                color: whiteColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w800),
                          ),
                  ),
                );
              }),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  Column getSignupForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Username',
          style: getDefaultTextStyle.copyWith(
            color: Get.theme.primaryColor,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        CustomTextField(
          TEC: controller.signupUserNameTEC,
          hint: "Enter your username...",
          textInputType: TextInputType.text,
          maxLines: 1,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Email Address',
          style: getDefaultTextStyle.copyWith(
            color: Get.theme.primaryColor,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        CustomTextField(
          TEC: controller.signupEmailTEC,
          hint: "Enter your email address...",
          textInputType: TextInputType.text,
          maxLines: 1,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Password',
          style: getDefaultTextStyle.copyWith(
            color: Get.theme.primaryColor,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        CustomTextField(
          TEC: controller.signupPasswordTEC,
          hint: "Enter your password...",
          textInputType: TextInputType.text,
          maxLines: 1,
          isPassword: true,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Phone',
          style: getDefaultTextStyle.copyWith(
            color: Get.theme.primaryColor,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        CustomTextField(
          TEC: controller.signupUserPhoneTEC,
          hint: "Enter your phone number...",
          textInputType: TextInputType.text,
          maxLines: 1,
        ),
      ],
    );
  }

  Column getSignupWIthSocialMediaTab() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Or signup using',
          style: getDefaultTextStyle.copyWith(
            color: Get.isDarkMode ? greyColor : blackColor.withOpacity(.6),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomButtonSosmed(
              icon: FontAwesomeIcons.facebook,
              onTap: () {},
              color: darkBlueColor,
            ),
            const SizedBox(
              width: 10,
            ),
            CustomButtonSosmed(
              icon: FontAwesomeIcons.google,
              onTap: () {},
              color: Colors.red,
            ),
            const SizedBox(
              width: 10,
            ),
            CustomButtonSosmed(
              icon: FontAwesomeIcons.apple,
              onTap: () {},
              color: Colors.black,
            )
          ],
        )
      ],
    );
  }
}
