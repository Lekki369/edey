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
              color: Colors.grey.shade400,
            ),
            child: Center(
              child: InkWell(
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        cursorColor: Colors.grey.shade600,
                        // controller: ,
                        decoration: InputDecoration(
                          border:
                              UnderlineInputBorder(borderSide: BorderSide.none),
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
