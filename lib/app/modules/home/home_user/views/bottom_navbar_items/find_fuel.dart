import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';

import '../../controllers/home_user_controller.dart';

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
