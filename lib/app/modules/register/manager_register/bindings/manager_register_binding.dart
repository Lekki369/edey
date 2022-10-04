import 'package:get/get.dart';

import '../controllers/manager_register_controller.dart';

class ManagerRegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManagerRegisterController>(
      () => ManagerRegisterController(),
    );
  }
}
