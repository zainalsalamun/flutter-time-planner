import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_planner/controllers/authentication_module_controller.dart';
import 'package:time_planner/theme/theme.dart';
import 'package:time_planner/widget/circular_progress_loading.dart';
import 'package:time_planner/widget/widget_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final AuthenticationModuleController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: whiteColor,
        ),
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                'assets/tm-mobile-logo.png',
                height: 70,
              ),
              const SizedBox(
                height: 20,
              ),
              getLoginForm(),
              const SizedBox(
                height: 20,
              ),
              Obx(() {
                return GestureDetector(
                  onTap: controller.onLoginButtonClick,
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
                    child: controller.showLoginButtonLoadingAnimation.value
                        ? const CircularProgressLoading()
                        : Text(
                            'Login',
                            style: getBoldTextStyle,
                          ),
                  ),
                );
              }),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: controller.onSignupOnLoginPageButtonClick,
                child: Text(
                  'Don\'t have an account? Register here',
                  style: getDefaultTextStyle.copyWith(
                    color: Get.theme.colorScheme.primary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }

  Column getLoginForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          TEC: controller.loginEmailTEC,
          hint: "Enter Your email address....",
          textInputType: TextInputType.emailAddress,
          maxLines: 1,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextField(
          TEC: controller.loginPasswordTEC,
          hint: "Enter your password..",
          textInputType: TextInputType.text,
          maxLines: 1,
          isPassword: true,
        )
      ],
    );
  }
}
