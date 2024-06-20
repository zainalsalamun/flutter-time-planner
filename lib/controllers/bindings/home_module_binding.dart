import 'package:get/get.dart';
import 'package:time_planner/controllers/home_module_controller.dart';

class HomeModuleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeModuleController());
  }
}
