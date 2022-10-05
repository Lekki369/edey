import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ManagerRegisterController extends GetxController {
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

  void register(String email, String password) async {
    isLoading.value = true;
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "network-request-failed":
          Get.snackbar(
            'No Internet',
            'Check your network',
            colorText: Colors.red,
            backgroundColor: const Color.fromARGB(255, 58, 41, 250),
          );
          break;
        case "wrong-password":
          Get.defaultDialog(
            title: 'Info',
            titleStyle: _style,
            confirm: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.cancel_outlined),
            ),
            content: Column(
              children: [
                Text(
                  'Wrong Password!',
                  style: _style2,
                ),
                Text(
                  'Try again',
                  style: _style2,
                ),
              ],
            ),
          );
          break;
        case "invalid-email":
          Get.defaultDialog(
            title: 'Info',
            titleStyle: _style,
            confirm: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.cancel_outlined),
            ),
            content: Column(
              children: [
                Text(
                  'Invalid Email!',
                  style: _style2,
                ),
              ],
            ),
          );
          break;
        case "user-not-found":
          Get.defaultDialog(
            title: 'Info',
            titleStyle: _style,
            confirm: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.cancel_outlined),
            ),
            content: Column(
              children: [
                Text(
                  'Email Not Found!',
                  style: _style2,
                ),
              ],
            ),
          );
          break;
        case "user-disabled":
          Get.defaultDialog(
            title: 'Info',
            titleStyle: _style,
            confirm: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.cancel_outlined),
            ),
            content: Column(
              children: [
                Text(
                  'This User Has Been',
                  style: _style2,
                ),
                Text(
                  'Disabled!',
                  style: _style2,
                ),
              ],
            ),
          );
          break;

        case "too-many-requests":
          Get.defaultDialog(
            title: 'Info',
            titleStyle: _style,
            confirm: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.cancel_outlined),
            ),
            content: Column(
              children: [
                Text(
                  'Too Many Request!!!',
                  style: _style2,
                ),
                Text(
                  'Try Again Later.',
                  style: _style2,
                ),
              ],
            ),
          );
          break;

        case "email-already-in-use":
          Get.defaultDialog(
            title: 'Info',
            titleStyle: _style,
            confirm: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.cancel_outlined),
            ),
            content: Column(
              children: const [
                Text('Email Already Exist'),
                Text('Try Login'),
              ],
            ),
          );
          break;
        case "operation-not-allowed":
          Get.defaultDialog(
            title: 'Info',
            titleStyle: _style,
            confirm: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.cancel_outlined),
            ),
            content: Column(
              children: const [
                Text('Operation not allowed!'),
                Text('Try Again'),
              ],
            ),
          );
          break;
        default:
          Get.defaultDialog(
            title: 'Info',
            titleStyle: _style,
            confirm: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.cancel_outlined),
            ),
            content: Column(
              children: const [
                Text('Error!!!'),
                Text('Contact Support.'),
              ],
            ),
          );
      }

      isLoading.value = false;
    }
  }
}
