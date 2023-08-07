import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:temp_store/controllers/authController.dart';
import 'package:temp_store/controllers/sellPageController.dart';
import 'package:temp_store/controllers/userController.dart';

class firebaseStorage {
  final FirebaseStorage _storageReference = FirebaseStorage.instance;
  final user = Get.find<AuthController>().user;

  // Store User Image in Firebase Storage
  Future<String> storeUserImageFirebaseStorage(String? profileImage) async {
    try {
      if (user == null || profileImage == '') {
        return '';
      }
      final profileImageRef =
          _storageReference.ref().child('profilePictures').child(user!.uid);
      final uploadTask = profileImageRef.putFile(File(profileImage!));
      var downloadURL = '';

      await uploadTask.whenComplete(() async {
        downloadURL = await profileImageRef.getDownloadURL();
        print('Profile Picture uploaded to Firebase Storage');
        Get.find<UserController>().user!.image = downloadURL;
        return downloadURL;
      });
      return downloadURL;
    } catch (e) {
      print('Error uploading image: $e');
      // Show error snackbar or toast
      // Get.snackbar('Error', 'Failed to update profile picture');
      return '';
    }
  }

  // Store User Images in Firebase Storage
  Future<List<String>> storeProductImagesFirebaseStorage(
      List<File> productImages) async {
    var imageUrls = await Future.wait(
        productImages.map((image) => _uploadProductImage(image)));
    print('Product Picture uploaded to Firebase Storage');
    return imageUrls;
  }

  Future<String> _uploadProductImage(File image) async {
    final phoneSellPost = Get.find<SellPageController>().sellFieldData;
    final imageStorageReference = _storageReference
        .ref()
        .child('postsPhone')
        .child(user!.uid)
        .child(
            '${phoneSellPost['title']}_${phoneSellPost['storage']}_${phoneSellPost['price']}_${phoneSellPost['images'].length.toString()}}')
        .child(
            '${DateTime.now().millisecondsSinceEpoch.toString()}_${DateTime.now().microsecondsSinceEpoch}.jpg');
    final uploadTask = imageStorageReference.putFile(image);
    var downloadURL = '';
    await uploadTask.whenComplete(() async {
      downloadURL = await imageStorageReference.getDownloadURL();
      return downloadURL;
    });
    return downloadURL;
  }
}
