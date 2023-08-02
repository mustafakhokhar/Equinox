import 'package:get/get.dart';
import 'package:temp_store/controllers/authController.dart';
import 'package:temp_store/models/userModel.dart';
import 'package:temp_store/services/database.dart';
import 'package:temp_store/views/buyers/AppMainNavigation.dart';

import '../models/phoneModel.dart';

class UserController extends GetxController {
  // Make UserModel (defined in models) "observable"
  final Rx<UserModel?> _userModel = Rx<UserModel?>(null);

  // Getter for UserModel or way to access UserModel
  UserModel? get user => _userModel.value;

  // Setter for UserModel
  set user(UserModel? value) => _userModel.value = value;

  void clear() {
    _userModel.value = UserModel(
        address: null,
        email: null,
        image: null,
        id: null,
        password: null,
        name: null,
        phone: null,
        phoneAds: []);
  }

  // get all the ads posted by the User
  getUserPhoneAds() {
    if (_userModel.value == null) {
      return [];
    }
    final List? userPhoneAds = _userModel.value!.phoneAds;
    List<PhoneModel> retVal = [];

    for (var element in userPhoneAds!) {
      retVal.add(PhoneModel.fromMap(element));
    }
    return retVal;
  }

  // Update User Profile
  Future<void> updateUserProfile(
      String uName, String uAddress, String uImage, String uPhone) async {
    try {
      UserModel _user = UserModel(
        id: Get.find<AuthController>().user!.uid,
        name: uName,
        phone: uPhone,
        email: user!.email,
        password: user!.password,
        address: uAddress,
        image: '',
        phoneAds: user!.phoneAds,
      );

      if (await Database().updateUserProfileFirestore(_user, uImage)) {
        Get.find<UserController>().user = _user;
        user!.image = uImage;
        Get.off(AppNavigationScreen(
          index: 4,
        ));
      } else {
        print('Error Creating User in Firestore');
      }
      Get.snackbar('Profile Updated', user!.email.toString(),
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      print('Error updating user profile: $e');
    }
  }
}
