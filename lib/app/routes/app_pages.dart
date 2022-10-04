import 'package:get/get.dart';

import 'package:edey/app/modules/home/home_manager/bindings/home_manager_binding.dart';
import 'package:edey/app/modules/home/home_manager/views/home_manager_view.dart';
import 'package:edey/app/modules/home/home_user/bindings/home_user_binding.dart';
import 'package:edey/app/modules/home/home_user/views/home_user_view.dart';
import 'package:edey/app/modules/login/manager_login/bindings/manager_login_binding.dart';
import 'package:edey/app/modules/login/manager_login/views/manager_login_view.dart';
import 'package:edey/app/modules/login/user_login/bindings/user_login_binding.dart';
import 'package:edey/app/modules/login/user_login/views/user_login_view.dart';
import 'package:edey/app/modules/register/manager_register/bindings/manager_register_binding.dart';
import 'package:edey/app/modules/register/manager_register/views/manager_register_view.dart';
import 'package:edey/app/modules/register/user_register/bindings/user_register_binding.dart';
import 'package:edey/app/modules/register/user_register/views/user_register_view.dart';
import 'package:edey/app/modules/welcomepage/views/welcomepage_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // static const INITIAL = Routes.HOME;

  static final routes = [
    // GetPage(
    //   name: _Paths.HOME,
    //   page: () => HomeView(),
    //   binding: HomeBinding(),
    // ),
    GetPage(
      name: _Paths.USER_LOGIN,
      page: () => UserLoginView(),
      binding: UserLoginBinding(),
    ),
    GetPage(
      name: _Paths.MANAGER_LOGIN,
      page: () => ManagerLoginView(),
      binding: ManagerLoginBinding(),
    ),
    GetPage(
      name: _Paths.USER_REGISTER,
      page: () => UserRegisterView(),
      binding: UserRegisterBinding(),
    ),
    GetPage(
      name: _Paths.MANAGER_REGISTER,
      page: () => ManagerRegisterView(),
      binding: ManagerRegisterBinding(),
    ),
    GetPage(
      name: _Paths.WELCOMEPAGE,
      page: () => WelcomepageView(),
    ),
    GetPage(
      name: _Paths.HOME_MANAGER,
      page: () => HomeManagerView(),
      binding: HomeManagerBinding(),
    ),
    GetPage(
      name: _Paths.HOME_USER,
      page: () => HomeUserView(),
      binding: HomeUserBinding(),
    ),
  ];
}
