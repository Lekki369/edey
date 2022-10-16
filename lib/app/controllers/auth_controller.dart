import 'package:edey/app/controllers/location.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';

import '../routes/app_pages.dart';

class AuthController extends GetxController {
  late Rx<User?> _user;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    Get.put(LocationController());
    _user = Rx<User?>(_auth.currentUser);
    _user.bindStream(_auth.userChanges());
    ever(_user, initialLoading);
    super.onReady();
  }

  initialLoading(User? user) {
    if (user == null) {
      print('user is null');
      Get.offAllNamed(Routes.WELCOMEPAGE);
    } else {
      Get.offAllNamed(Routes.HOME_USER);
    }
  }
}
