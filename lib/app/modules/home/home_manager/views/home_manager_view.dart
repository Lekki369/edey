import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_manager_controller.dart';

class HomeManagerView extends GetView<HomeManagerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeManagerView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'HomeManagerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
