import 'package:get/get.dart';
import 'package:time_planner/controllers/authentication_module_controller.dart';

class AuthenticationModuleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthenticationModuleController());
  }
}
