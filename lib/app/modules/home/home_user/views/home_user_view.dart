// ignore_for_file: must_be_immutable

import 'package:edey/app/modules/home/home_user/views/user_drawer.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_user_controller.dart';
import 'bottom_navbar_items/filling_station.dart';
import 'bottom_navbar_items/find_fuel.dart';
import 'bottom_navbar_items/locationpage.dart';
import 'user_appbar.dart';

class HomeUserView extends GetView<HomeUserController> {
  final List<Widget> _widgetOptions = [
    FindFuel(),
    const FillingStation(),
    LocationPage(),
    const Text('4')
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => controller.backButton(),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 187, 222, 251),
        appBar: AppBar(
            iconTheme: const IconThemeData(size: 30),
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: [
              Actionbar(),
            ]),
        drawer: UserDrawer(),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
              currentIndex: controller.selectedIndex.value,
              onTap: controller.onItemTapped,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: const Color.fromARGB(255, 51, 41, 250),
              unselectedItemColor: const Color.fromARGB(255, 187, 222, 251),
              items: [
                BottomNavigationBarItem(
                  label: '',
                  icon: CircleAvatar(
                    backgroundColor: controller.selectedIndex.value == 0
                        ? const Color.fromARGB(255, 51, 41, 250)
                        : const Color.fromARGB(255, 187, 222, 251),
                    child: Icon(
                      Icons.home_outlined,
                      color: controller.selectedIndex.value == 0
                          ? const Color.fromARGB(255, 187, 222, 251)
                          : const Color.fromARGB(255, 51, 41, 250),
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: '',
                  icon: CircleAvatar(
                    backgroundColor: controller.selectedIndex.value == 1
                        ? const Color.fromARGB(255, 51, 41, 250)
                        : const Color.fromARGB(255, 187, 222, 251),
                    child: Icon(
                      Icons.local_gas_station_outlined,
                      color: controller.selectedIndex.value == 1
                          ? const Color.fromARGB(255, 187, 222, 251)
                          : const Color.fromARGB(255, 51, 41, 250),
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: '',
                  icon: CircleAvatar(
                    backgroundColor: controller.selectedIndex.value == 2
                        ? const Color.fromARGB(255, 51, 41, 250)
                        : const Color.fromARGB(255, 187, 222, 251),
                    child: Icon(
                      Icons.map_outlined,
                      color: controller.selectedIndex.value == 2
                          ? const Color.fromARGB(255, 187, 222, 251)
                          : const Color.fromARGB(255, 51, 41, 250),
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: '',
                  icon: CircleAvatar(
                    backgroundColor: controller.selectedIndex.value == 3
                        ? const Color.fromARGB(255, 51, 41, 250)
                        : const Color.fromARGB(255, 187, 222, 251),
                    child: Icon(
                      Icons.person_outline,
                      color: controller.selectedIndex.value == 3
                          ? const Color.fromARGB(255, 187, 222, 251)
                          : const Color.fromARGB(255, 51, 41, 250),
                    ),
                  ),
                ),
              ],
            )),
        body: Obx(() => Center(
              child: _widgetOptions[controller.selectedIndex.value],
            )),
      ),
    );
  }
}
