import 'package:get/get.dart';

import '../../../../controllers/location.dart';

class HomeUserController extends GetxController {
  Rx<bool> trigger = true.obs;
  Rx<int> selectedIndex = 0.obs;

  bool backButton() {
    selectedIndex.value = 0;
    trigger.value = !trigger.value;
    return trigger.value;
  }

  List fuel = ['Peterol', 'Kerosene', 'Diesel', 'Gasoline'];
  Rx<String?> selecteditem = 'Peterol'.obs;
  LocationController locationController = Get.find();

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
