import 'package:get/get.dart';
import 'package:temp_store/controllers/UIcontrollers/bottomSheetDataController.dart';
import 'package:temp_store/controllers/authController.dart';
import 'package:temp_store/controllers/userController.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.lazyPut<UserController>(() => UserController(), fenix: true);
    Get.lazyPut<BottomSheetsDataController>(() => BottomSheetsDataController(),
        fenix: true);
  }
}
