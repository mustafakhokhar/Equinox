import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:temp_store/controllers/authController.dart';
import 'package:temp_store/controllers/userController.dart';
import 'package:temp_store/models/phoneModel.dart';
import 'package:temp_store/services/database.dart';
import 'package:temp_store/services/firebaseStorage.dart';

class SellPageController extends GetxController {
  final _sellFieldData = <String, dynamic>{}.obs;
  Map<String, dynamic> get sellFieldData => _sellFieldData;

  Future<void> postAd() async {
    List<File> rawImagesPath = sellFieldData['images'];

    try {
      await firebaseStorage()
          .storeProductImagesFirebaseStorage(rawImagesPath)
          .then((productImagesURLs) async {

        PhoneModel phoneSellPostModel = PhoneModel(
          sellerID: Get.find<AuthController>().user?.uid,
          sellerName: Get.find<UserController>().user?.name,
          sellerPhone: Get.find<UserController>().user?.phone,
          sellerImage: 'https://i.imgur.com/BoN9kdC.png',
          make: sellFieldData['make'],
          title: sellFieldData['title'],
          location: sellFieldData['location'],
          variant: 'LLA',
          storage: sellFieldData['storage'],
          color: sellFieldData['color'],
          pta: sellFieldData['pta'],
          jv: sellFieldData['jv'],
          batteryHealth: sellFieldData['batteryHealth'],
          condition: sellFieldData['condition'],
          subCondition: sellFieldData['subCondition'],
          accessories: {},
          sellerComment: sellFieldData['sellerComment'],
          city: sellFieldData['city'],
          featured: false,
          isSold: false,
          images: productImagesURLs,
          price: int.parse(sellFieldData['price']),
        );
        await Database().addNewProduct(phoneSellPostModel).then((value) {
          print('Product Added');
          Get.back();
          Get.snackbar(
            'Success',
            'Ad Posted Successfully',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: CupertinoColors.systemGreen,
          );
        });
      });
    } catch (e) {
      print('Error: $e');
      Get.snackbar(
        'Error',
        'Error Posting Ad',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: CupertinoColors.systemRed,
      );
    }
  }
}
