import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../controllers/home_user_controller.dart';

class UserDrawer extends GetView<HomeUserController> {
  const UserDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.6,
      backgroundColor: const Color.fromARGB(184, 187, 222, 251),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.only(
          right: 24.w,
          left: 17.w,
          top: 62.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    // TODO: USER PICTURE
                    Padding(
                      padding: EdgeInsets.only(left: 12.0.w),
                      child: CircleAvatar(
                          backgroundColor: Colors.white, radius: 68.r),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.settings_outlined),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0.w),
              child: const Text(
                // TODO: USERNAME OR DISPLAYNAME
                'User Name',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () async {
                    Get.offAllNamed(Routes.MANAGER_LOGIN);
                    await FirebaseAuth.instance.signOut();
                  },
                  child: const Text(
                    'Switch to Manager',
                    style: TextStyle(
                      color: Color.fromARGB(255, 51, 41, 250),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                // TODO: down-arrow iconbutton
              ],
            ),
            const Divider(),
            Padding(
              padding: EdgeInsets.only(right: 35.0.w),
              child: Column(
                children: [
                  InkWell(
                    onTap: () async {
                      await Get.defaultDialog(
                        titlePadding: const EdgeInsets.all(0),
                        title: '',
                        radius: 0,
                        contentPadding: const EdgeInsets.all(0),
                        content: SizedBox(
                          height: 300.h,
                          width: 400.w,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'PROFILE PHOTO',
                                      style: TextStyle(
                                          fontSize: 25.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    IconButton(
                                      iconSize: 35.sp,
                                      onPressed: (() => Get.back()),
                                      icon: const Icon(Icons.close),
                                    )
                                  ],
                                ),
                                SizedBox(height: 67.h),
                                InkWell(
                                  child: Container(
                                      height: 58.h,
                                      width: 335.w,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10.h),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 51, 41, 250),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(width: 22.w),
                                          Icon(
                                            Icons.add_a_photo_outlined,
                                            size: 23.sp,
                                          ),
                                          SizedBox(width: 65.w),
                                          Text(
                                            'Camera',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 25.sp),
                                          )
                                        ],
                                      )),
                                ),
                                SizedBox(height: 43.h),
                                InkWell(
                                  child: Container(
                                      height: 58.h,
                                      width: 335.w,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10.h),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 51, 41, 250),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(width: 22.w),
                                          Icon(
                                            Icons.add_photo_alternate_outlined,
                                            size: 23.sp,
                                          ),
                                          SizedBox(width: 65.w),
                                          Text(
                                            'Gallery',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 25.sp),
                                          )
                                        ],
                                      )),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Add Photo',
                          style: TextStyle(
                              fontSize: 23.53.sp, color: Colors.black54),
                        ),
                        const Icon(
                          Icons.add_photo_alternate_outlined,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 21.h,
                  ),
                  InkWell(
                    onTap: () async {
                      await Get.defaultDialog(
                        titlePadding: const EdgeInsets.all(0),
                        title: '',
                        radius: 0,
                        contentPadding: const EdgeInsets.all(0),
                        content: SizedBox(
                          height: 360.h,
                          width: 400.w,
                          child: Column(
                            children: [
                              Text(
                                'ABOUT US',
                                style: TextStyle(
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 17.w),
                                child: Column(
                                  children: [
                                    Text(
                                      softWrap: true,
                                      textAlign: TextAlign.center,
                                      "eDey is a Mobile App that lets users know when there’s Fuel in the station. It was designed by Dominion Abiodun and Built with Flutter. Other Team members are Lekan(Flutter Dev), Gbenga(Full-Stack), Ore(ML) & Rhamat(Data Science)",
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(height: 24.h),
                                    Text(
                                      softWrap: true,
                                      textAlign: TextAlign.center,
                                      "eDey is a Mobile App that lets users know when there’s Fuel in the station. It was designed by Dominion Abiodun and Built with Flutter. Other Team members are Lekan(Flutter Dev), Gbenga(Full-Stack), Ore(ML) & Rhamat(Data Science)  ",
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 8.0.w),
                                    child: TextButton(
                                      onPressed: () => Get.back(),
                                      child: Text(
                                        'CLOSE',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'About Us',
                          style: TextStyle(
                              fontSize: 23.53.sp, color: Colors.black54),
                        ),
                        const Icon(
                          Icons.person,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 21.h,
                  ),
                  InkWell(
                    onTap: () async {
                      await Get.defaultDialog(
                        titlePadding: const EdgeInsets.all(0),
                        title: '',
                        radius: 0,
                        contentPadding: const EdgeInsets.all(0),
                        content: SizedBox(
                          height: 300.h,
                          width: 400.w,
                          child: Column(
                            children: [
                              Text(
                                'CONTACT US',
                                style: TextStyle(
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 15.h),
                              Text(
                                'ooo',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                'ooo',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                'ooo',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                'ooo',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                'ooo',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                'ooo',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 8.0.w),
                                    child: TextButton(
                                      onPressed: () => Get.back(),
                                      child: Text(
                                        'CLOSE',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Contact Us',
                          style: TextStyle(
                              fontSize: 23.53.sp, color: Colors.black54),
                        ),
                        const Icon(
                          Icons.phone_outlined,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 21.h,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Stations Nearby',
                          style: TextStyle(
                              fontSize: 23.53.sp, color: Colors.black54),
                        ),
                        const Icon(
                          Icons.gas_meter_outlined,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 21.h,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rate App',
                          style: TextStyle(
                              fontSize: 23.53.sp, color: Colors.black54),
                        ),
                        const Icon(
                          Icons.thumb_up_outlined,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 21.h,
                  ),
                  InkWell(
                    onTap: () async {
                      await Get.defaultDialog(
                        titlePadding: const EdgeInsets.all(0),
                        title: '',
                        radius: 0,
                        contentPadding: const EdgeInsets.all(0),
                        content: SizedBox(
                          height: 636.h,
                          width: 400.w,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 21.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'PRIVACY & CONTENT POLICY',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 35.h),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  child: const Text(
                                    textAlign: TextAlign.center,
                                    'The app only collects users pictures and email for sign up purposes.',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w400),
                                  ),
                                ),
                                SizedBox(height: 25.h),
                                const Text(
                                  textAlign: TextAlign.center,
                                  'Consequently, the app doesn’t share any personal information with any other entity or third parties',
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                ),
                                SizedBox(height: 25.h),
                                const Text(
                                  textAlign: TextAlign.center,
                                  'Consequently, the app doesn’t share any personal information with any other entity or third parties',
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                ),
                                SizedBox(height: 25.h),
                                const Text(
                                  textAlign: TextAlign.center,
                                  'Consequently, the app doesn’t share any personal information with any other entity or third parties',
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                ),
                                SizedBox(height: 25.h),
                                const Text(
                                  textAlign: TextAlign.center,
                                  'Consequently, the app doesn’t share any personal information with any other entity or third parties',
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                ),
                                SizedBox(height: 25.h),
                                const Text(
                                  textAlign: TextAlign.center,
                                  'Consequently, the app doesn’t share any personal information with any other entity or third parties',
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                ),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () => Get.back(),
                                      child: Text(
                                        'CLOSE',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Privacy Policy',
                          style: TextStyle(
                              fontSize: 23.53.sp, color: Colors.black54),
                        ),
                        const Icon(
                          Icons.library_books_outlined,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
