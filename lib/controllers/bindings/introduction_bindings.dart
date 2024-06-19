import 'package:get/get.dart';
import 'package:time_planner/controllers/authentication_module_controller.dart';
import 'package:time_planner/controllers/introduction_controller.dart';

class IntroductionModuleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => IntroductionController(),
    );
    Get.put(AuthenticationModuleController());
  }
}
