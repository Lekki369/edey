// ignore_for_file: must_be_immutable

import 'package:edey/app/modules/home/home_user/views/Loaction.dart';
import 'package:edey/app/modules/home/home_user/views/user_drawer.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:search_map_location/search_map_location.dart';

import '../controllers/home_user_controller.dart';
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          width: 2.w,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 51, 41, 250),
                          width: 2.w,
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
                  InkWell(
                    onTap: () => controller.selectedIndex.value = 2,
                    child: Container(
                      padding: EdgeInsets.all(11),
                      width: double.maxFinite,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                          color: const Color.fromARGB(255, 51, 41, 250),
                          width: 2.w,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(() => Text(
                                controller
                                    .locationController.selectedLocation.value,
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                          Icon(Icons.location_on_outlined)
                        ],
                      ),
                    ),
                  ),
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
                      onPressed: () {
                        controller.selectedIndex.value = 1;
                      },
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
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 25.w, right: 25.w),
          child: Container(
            height: 50.h,
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 8.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: Colors.grey.shade400,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    cursorColor: Colors.grey.shade600,
                    // controller: ,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(borderSide: BorderSide.none),
                      prefixIcon: Icon(
                        Icons.search_outlined,
                        size: 30.sp,
                        color: Colors.grey.shade600,
                      ),
                      suffixIcon: Icon(
                        Icons.local_gas_station_rounded,
                        size: 30.sp,
                        color: Colors.grey.shade600,
                      ),
                      hintText: 'Search Station...',
                      isDense: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 40.h,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 150.h,
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10.r),
                  onTap: () {
                    print('object $index');
                  },
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          padding: EdgeInsets.all(14.sp),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 130.h,
                                width: 130.w,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.r),
                                  child: Container(
                                    color: Colors.amber,
                                    child: Center(
                                      child: Text('Image'),
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(
                                flex: 2,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Filling Station Example',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Status:',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                      Text(
                                        ' NO',
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'NGN300/Ltr',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 120.h / 2,
                        left: 405.w,
                        child: CircleAvatar(
                          backgroundColor:
                              const Color.fromARGB(255, 51, 41, 250),
                          child: Icon(
                            Icons.arrow_forward,
                            size: 35.sp,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class LocationPage extends GetView<HomeUserController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(
        children: [
          SearchLocation(
            iconColor: const Color.fromARGB(255, 51, 41, 250),
            hasClearButton: true,
            apiKey: '',
            // child: TextField(
            //   keyboardType: TextInputType.text,
            //   textInputAction: TextInputAction.done,
            //   cursorColor: Colors.grey.shade600,
            //   // controller: ,
            //   decoration: InputDecoration(
            //     border: UnderlineInputBorder(borderSide: BorderSide.none),
            //     prefixIcon: Icon(
            //       Icons.search_outlined,
            //       size: 30.sp,
            //       color: Colors.grey.shade600,
            //     ),
            //     suffixIcon: Icon(
            //       Icons.local_gas_station_rounded,
            //       size: 30.sp,
            //       color: Colors.grey.shade600,
            //     ),
            //     hintText: 'Search Station...',
            //     isDense: true,
            //   ),
            // ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    controller.locationController.currentLocation();
                    controller.selectedIndex.value = 0;
                  },
                  child: Locations('Your Area', Icons.location_on_outlined),
                ),
                Locations('Map', Icons.map_outlined),
                Locations('Home', Icons.home_outlined),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey.shade600,
                          width: 1.5.w,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.history,
                          size: 25.sp,
                          color: Colors.grey.shade600,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          'Location Hstory',
                          style: TextStyle(
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w400,
                              fontSize: 18.sp),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
