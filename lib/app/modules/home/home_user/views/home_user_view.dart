// ignore_for_file: must_be_immutable

import 'package:edey/app/modules/home/home_user/views/user_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/home_user_controller.dart';
import 'user_appbar.dart';

class HomeUserView extends GetView<HomeUserController> {
  final List<Widget> _widgetOptions = [
    FindFuel(),
    const FillingStation(),
    const Text('3'),
    const Text('4')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}

class FindFuel extends GetView<HomeUserController> {
  FindFuel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Find Fuel',
          style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 85.h),
        Container(
          height: 337.h,
          width: 400.w,
          color: Colors.white,
          child: Center(
            child: SizedBox(
              width: 300.w,
              height: 257.h,
              child: Column(
                children: [
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      labelText: 'Select Fuel',
                      labelStyle: TextStyle(
                        color: const Color.fromARGB(255, 51, 41, 250),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 51, 41, 250),
                          width: 1.3.w,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 51, 41, 250),
                          width: 1.3.w,
                        ),
                      ),
                    ),
                    elevation: 0,
                    icon: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: 30,
                      color: const Color.fromARGB(255, 44, 58, 75),
                    ),
                    value: controller.selecteditem.value,
                    items: controller.fuel
                        .map(
                          (item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          ),
                        )
                        .toList(),
                    onChanged: (item) {
                      controller.selecteditem = Rx(item);
                      print(controller.selecteditem);
                    },
                  ),
                  Spacer(),
                  Container(
                    width: double.maxFinite,
                    height: 50,
                    color: Colors.amberAccent,
                  ),
                  Spacer(),
                  Container(
                    width: double.maxFinite,
                    height: 50,
                    color: const Color.fromARGB(255, 51, 41, 250),
                    child: TextButton(
                      child: Text(
                        'Find Fuel',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      // TODO: location handler
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class FillingStation extends GetView<HomeUserView> {
  const FillingStation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.w, right: 25.w),
      child: Column(
        children: [
          Container(
            height: 50.h,
            width: double.maxFinite,
            color: Colors.amber,
          )
        ],
      ),
    );
  }
}
