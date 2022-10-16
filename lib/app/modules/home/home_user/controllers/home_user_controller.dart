import 'package:get/get.dart';

import '../../../../controllers/location.dart';

class HomeUserController extends GetxController {
  Rx<int> selectedIndex = 0.obs;

  List fuel = ['Peterol', 'Kerosene', 'Diesel', 'Gasoline'];
  Rx<String?> selecteditem = 'Peterol'.obs;
  LocationController locationController = Get.find();

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
