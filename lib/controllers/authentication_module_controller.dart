import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_planner/constants/constants.dart';
import 'package:time_planner/routes/routes.dart';
import 'package:time_planner/services/authentication_function.dart';
import '../data/model/user_model.dart';
import '../widget/snackbar.dart';

class AuthenticationModuleController {
  late UserModel userModel;

  TextEditingController loginEmailTEC = TextEditingController();
  TextEditingController loginPasswordTEC = TextEditingController();
  var showLoginButtonLoadingAnimation = false.obs;

  TextEditingController signupEmailTEC = TextEditingController();
  TextEditingController signupPasswordTEC = TextEditingController();
  TextEditingController signupUserNameTEC = TextEditingController();
  TextEditingController signupUserPhoneTEC = TextEditingController();

  var showSignupButtonLoadingAnimation = false.obs;

  void onSignupOnLoginPageButtonClick() {
    Get.to(
      () => SignupScreen(),
    );
  }

  onLoginButtonClick() async {
    String email = loginEmailTEC.value.text;
    String password = loginPasswordTEC.value.text;
    if (email.isNotEmpty && password.isNotEmpty) {
      showLoginButtonLoadingAnimation.value = true;
      await Future.delayed(waitTime);
      var result = await AuthenticationFunction()
          .loginUser(email: email, password: password);
      if (result == "Success") {
        userModel = await AuthenticationFunction().getUserData();
        loginEmailTEC.text = '';
        loginPasswordTEC.text = '';
        Get.offAllNamed(Routes.getHomeScreenRoute);
      } else {
        showSnackBar(
          title: "Error",
          message: result.toString(),
        );
      }
      showLoginButtonLoadingAnimation.value = false;
    } else {
      showSnackBar(
        title: "Error!",
        message: "User credentials cannot be left empty. :(",
      );
    }
  }

  void onSignupButtonClick() async {
    String userName = signupUserNameTEC.value.text;
    String email = signupEmailTEC.value.text;
    String password = signupPasswordTEC.value.text;
    String phone = signupUserPhoneTEC.value.text;
    if (phone.isNotEmpty &&
        userName.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty) {
      showLoginButtonLoadingAnimation.value = true;
      await Future.delayed(const Duration(seconds: 2));
      String result = await AuthenticationFunction().signUpUser(
          email: email, password: password, userName: userName, phone: phone);
      if (result == 'Success') {
        userModel = await AuthenticationFunction().getUserData();
        signupUserNameTEC.text = signupPasswordTEC.text =
            signupEmailTEC.text = signupUserPhoneTEC.text = '';
        Get.offAllNamed(Routes.getHomeScreenRoute);
      } else {
        showSnackBar(
          title: "Error",
          message: result,
        );
      }
      showSignupButtonLoadingAnimation.value = false;
    } else {
      showSnackBar(
        title: "Error signing up!!",
        message: "User credentials cannot be left empty. :(",
      );
    }
  }

  void logoutUser() {
    FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.getLoginScreenRoute);
  }

  void deleteUser() async {
    String success = await AuthenticationFunction().deleteUser();
    if (success == 'Success') {
      logoutUser();
      showSnackBar(
          title: "Bye! :", message: "Your user profile has been deleted!");
    }
  }
}

class SignupScreen {}
