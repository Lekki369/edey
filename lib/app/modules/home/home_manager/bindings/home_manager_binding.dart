import 'package:get/get.dart';

import '../controllers/home_manager_controller.dart';

class HomeManagerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeManagerController>(
      () => HomeManagerController(),
    );
  }
}
