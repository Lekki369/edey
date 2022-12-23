import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../helper.dart';

class ManagerLoginController extends GetxController {
  var isVisible = true.obs;

  var isLoading = false.obs;
  final TextStyle _style = TextStyle(
    fontSize: 25.sp,
    fontWeight: FontWeight.w600,
    color: const Color.fromARGB(255, 58, 41, 250),
  );
  final TextStyle _style2 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  void visible() {
    isVisible.value = !isVisible.value;
  }

  void signIn(String email, String password) async {
    isLoading.value = true;
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
    } on FirebaseAuthException catch (e) {
      problemInfo(e.code, _style, _style2);

      isLoading.value = false;
    }
  }
}
