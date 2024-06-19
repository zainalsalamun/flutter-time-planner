import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:time_planner/controllers/authentication_module_controller.dart';
import 'package:time_planner/routes/routes.dart';
import 'package:time_planner/services/authentication_function.dart';

class IntroductionController {
  var currentPageIndex = 0.obs;

  void triggerSplashScreen() async {
    bool isFirtBoot = await checkIfItsFisrtBoot();
    await Future.delayed(const Duration(seconds: 2));
    isFirtBoot
        ? Get.offNamed(Routes.getSplashScreenRoute)
        : checkIfUserIsloggedInOrNot();
  }

  void checkIfUserIsloggedInOrNot() async {
    if (FirebaseAuth.instance.currentUser != null) {
      final AuthenticationModuleController authenticationModuleController =
          Get.find();
      authenticationModuleController.userModel =
          await AuthenticationFunction().getUserData();
      Get.offNamed(Routes.getHomeScreenRoute);
    } else {
      Get.offNamed(Routes.getLoginScreenRoute);
    }
  }

  Future<bool> checkIfItsFisrtBoot() async {
    final box = GetStorage();
    var isFisrtBoot = await box.read("isFirstBoot");
    if (isFisrtBoot == null) {
      box.write("isFisrtBoot", false);
      return true;
    } else {
      return false;
    }
  }

  void onNextButtonClick() {
    if (currentPageIndex.value < 2) {
      currentPageIndex.value++;
    } else {
      Get.offNamed(Routes.getLoginScreenRoute);
    }
  }
}
