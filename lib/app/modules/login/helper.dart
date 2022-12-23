import 'package:flutter/material.dart';
import 'package:get/get.dart';

void problemInfo(var err, TextStyle style, TextStyle style2) {
  switch (err) {
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
        titleStyle: style,
        confirm: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.cancel_outlined),
        ),
        content: Column(
          children: [
            Text(
              'Wrong Password!',
              style: style2,
            ),
            Text(
              'Try again',
              style: style2,
            ),
          ],
        ),
      );
      break;
    case "invalid-email":
      Get.defaultDialog(
        title: 'Info',
        titleStyle: style,
        confirm: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.cancel_outlined),
        ),
        content: Column(
          children: [
            Text(
              'Invalid Email!',
              style: style2,
            ),
          ],
        ),
      );
      break;
    case "user-not-found":
      Get.defaultDialog(
        title: 'Info',
        titleStyle: style,
        confirm: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.cancel_outlined),
        ),
        content: Column(
          children: [
            Text(
              'Email Not Found!',
              style: style2,
            ),
          ],
        ),
      );
      break;
    case "user-disabled":
      Get.defaultDialog(
        title: 'Info',
        titleStyle: style,
        confirm: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.cancel_outlined),
        ),
        content: Column(
          children: [
            Text(
              'This User Has Been',
              style: style2,
            ),
            Text(
              'Disabled!',
              style: style2,
            ),
          ],
        ),
      );
      break;

    case "too-many-requests":
      Get.defaultDialog(
        title: 'Info',
        titleStyle: style,
        confirm: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.cancel_outlined),
        ),
        content: Column(
          children: [
            Text(
              'Too Many Request!!!',
              style: style2,
            ),
            Text(
              'Try Again Later.',
              style: style2,
            ),
          ],
        ),
      );
      break;

    case "email-already-in-use":
      Get.defaultDialog(
        title: 'Info',
        titleStyle: style,
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
        titleStyle: style,
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
        titleStyle: style,
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
}
