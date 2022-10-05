import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../controllers/manager_register_controller.dart';

class ManagerRegisterView extends GetView<ManagerRegisterController> {
  final _emailText = TextEditingController();

  final _passwordText = TextEditingController();
  final _staffText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 844.h, maxWidth: 450.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 64.h,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                  ),
                  SizedBox(
                    width: 110.w,
                  ),
                  SizedBox(
                    height: 90.h,
                    width: 130.w,
                    child: Image.asset('lib/assets/eDey x1.png'),
                  )
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                'Register',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 23.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    TextField(
                      cursorColor: const Color.fromARGB(255, 51, 41, 250),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailText,
                      decoration: InputDecoration(
                        label: Text(
                          'Email',
                          style: TextStyle(
                            color: const Color.fromARGB(225, 44, 58, 75),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        hintText: 'example@something.com',
                        suffixIcon: const Icon(
                          Icons.mail_outline,
                          color: Color.fromARGB(255, 122, 122, 122),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 44, 58, 75),
                            width: 1.3.w,
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 51, 41, 250),
                            width: 1.3.w,
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color.fromARGB(225, 122, 122, 122),
                            width: 2.sp,
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 67.h,
                    ),
                    Obx(
                      () {
                        bool isVisible = controller.isVisible.value;
                        return TextField(
                          cursorColor: const Color.fromARGB(255, 51, 41, 250),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: isVisible,
                          controller: _passwordText,
                          decoration: InputDecoration(
                            label: Text(
                              'Password',
                              style: TextStyle(
                                color: const Color.fromARGB(225, 44, 58, 75),
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            hintText: 'Enter Password',
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.visible();
                              },
                              icon: Icon(
                                isVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility_outlined,
                                color: const Color.fromARGB(255, 122, 122, 122),
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color.fromARGB(255, 44, 58, 75),
                                width: 1.3.w,
                              ),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color.fromARGB(255, 51, 41, 250),
                                width: 1.3.w,
                              ),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color.fromARGB(225, 122, 122, 122),
                                width: 2.sp,
                              ),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 67.h),
                    TextField(
                      cursorColor: const Color.fromARGB(255, 51, 41, 250),
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.emailAddress,
                      controller: _staffText,
                      decoration: InputDecoration(
                        label: Text(
                          'Staff ID',
                          style: TextStyle(
                            color: const Color.fromARGB(225, 44, 58, 75),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        hintText: 'ID',
                        suffixIcon: const Icon(
                          Icons.person_outline,
                          color: Color.fromARGB(255, 122, 122, 122),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 44, 58, 75),
                            width: 1.3.w,
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 51, 41, 250),
                            width: 1.3.w,
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color.fromARGB(225, 122, 122, 122),
                            width: 2.sp,
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 57.h,
                    ),
                    Container(
                      height: 70.h,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 58, 41, 250),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Obx(
                        () => TextButton(
                          // Login
                          onPressed: controller.isLoading.value
                              ? null
                              : () async {
                                  controller.register(
                                    _emailText.text,
                                    _passwordText.text,
                                  );
                                },
                          child: controller.isLoading.value
                              ? const CircularProgressIndicator(
                                  color: Colors.white)
                              : Text(
                                  'Register',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'You\'re a User?',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 44, 58, 75),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.toNamed(Routes.USER_REGISTER);
                          },
                          child: Text(
                            'Click Here',
                            style: TextStyle(
                              color: const Color.fromARGB(255, 0, 56, 255),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
