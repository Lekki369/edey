import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/home_user_controller.dart';

class Actionbar extends GetView<HomeUserController> {
  const Actionbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.0.w),
      child: IconButton(
        onPressed: () async {
          await Get.dialog(
            barrierDismissible: true,
            Scaffold(
              backgroundColor: Colors.transparent,
              body: Align(
                alignment: const Alignment(0.69, -0.98),
                child: Container(
                  padding: EdgeInsets.only(top: 5.h, bottom: 10.h),
                  height: 120.h,
                  width: 280.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 100.w),
                          Text(
                            'Status',
                            style: TextStyle(
                                color: const Color.fromARGB(225, 58, 41, 250),
                                fontSize: 25.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.only(bottom: 8.0.h),
                            child: IconButton(
                              onPressed: () => Get.back(),
                              icon: const Icon(Icons.close_outlined),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'No',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(width: 5.sp),
                          Text(
                            'means no Fuel',
                            style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Yes',
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(width: 5.sp),
                          Text(
                            'means There\'s Fuel',
                            style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.w400),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        icon: const Icon(Icons.help_outline),
      ),
    );
  }
}
