import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temp_store/controllers/userController.dart';
import 'package:temp_store/views/buyers/AppMainNavigation.dart';
import 'package:temp_store/views/onBoardingScreens/SignIn.dart';

import 'controllers/authController.dart';

class Root extends GetWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<AuthController>(
      initState: (_) async {
        Get.put<UserController>(UserController());
      },
      builder: (_) {
        if (Get.find<AuthController>().user?.uid != null) {
          return AppNavigationScreen(
            index: 2,
          );
        } else {
          return SignInScreen();
        }
      },
    );
  }
}


// class Root extends GetWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       return Get.find<AuthController>().user != null
//           ? const AppNavigationScreen()
//           : SignInScreen();
//     });
//   }
// }

// class Root extends GetWidget<AuthController> {
//   @override
//   Widget build(BuildContext context) {
//     return GetX<AuthController>(initState: (_) async {
//       Get.put<UserController>(UserController());
//     }, builder: (_) {
//       if (Get.find<AuthController>().user?.uid != null) {
//         return const AppNavigationScreen();
//       } else {
//         return SignInScreen();
//       }
//     });
//   }
// }
