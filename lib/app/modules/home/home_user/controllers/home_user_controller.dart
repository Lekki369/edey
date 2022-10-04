import 'package:get/get.dart';

class HomeUserController extends GetxController {
  Rx<int> selectedIndex = 0.obs;

  List fuel = ['Peterol', 'Kerosene', 'Diesel', 'Gasoline'];
  Rx<String?> selecteditem = 'Peterol'.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
