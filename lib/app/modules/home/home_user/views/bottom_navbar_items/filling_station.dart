import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';

import '../home_user_view.dart';

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
