import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:temp_store/controllers/authController.dart';
import 'package:temp_store/controllers/userController.dart';
import 'package:temp_store/models/userModel.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.lazyPut<UserController>(() => UserController(), fenix: true);
  }
}
