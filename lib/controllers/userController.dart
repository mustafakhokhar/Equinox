import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:temp_store/controllers/authController.dart';
import 'package:temp_store/models/userModel.dart';
import 'package:temp_store/services/database.dart';
import 'package:temp_store/services/firebaseStorage.dart';

import '../models/phoneModel.dart';

class UserController extends GetxController {
  final Rx<UserModel?> _userModel = Rx<UserModel?>(null);
  UserModel? get user => _userModel.value;
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
  getAllUserPhoneAds() {
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
      String uName, String uAddress, String uImageRaw, String uPhone) async {
    UserModel userDetails = UserModel(
      id: Get.find<AuthController>().user!.uid,
      name: uName,
      phone: uPhone,
      email: user!.email,
      password: user!.password,
      address: uAddress,
      image: '',
      phoneAds: user!.phoneAds,
    );
    try {
      await firebaseStorage()
          .storeUserImageFirebaseStorage(uImageRaw)
          .then((profileImageUrl) async {
        await Database().updateUser(userDetails, profileImageUrl).then((value) {
          Get.find<UserController>().user!.image = profileImageUrl;
          Get.back();
          Get.snackbar('Profile Updated', user!.email.toString(),
              snackPosition: SnackPosition.BOTTOM);
        });
      });
    } catch (e) {
      print('Error updating user profile: $e');
      Get.snackbar('Error updating user profile:', 'Profile cannot be updated',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: CupertinoColors.systemRed);
    }
  }
}
