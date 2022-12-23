import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import 'package:search_map_location/widget/search_widget.dart';

import '../../controllers/home_user_controller.dart';
import 'location.dart';

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
