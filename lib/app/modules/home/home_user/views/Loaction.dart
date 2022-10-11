import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/home_user_controller.dart';

class Locations extends GetView<HomeUserController> {
  final String _name;
  final IconData _icon;

  Locations(this._name, this._icon);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            _icon,
            size: 25.sp,
            color: const Color.fromARGB(255, 51, 41, 250),
          ),
          SizedBox(width: 10.w),
          Text(
            _name,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 18.sp),
          )
        ],
      ),
    );
  }
}
