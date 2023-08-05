import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:temp_store/controllers/authController.dart';
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

  // Store User Image in Firebase Storage
  Future<String> storeProductImagesFirebaseStorage(image) async {
    try {
      final ImageRef =
          _storageReference.ref().child('profilePictures').child(user!.uid);
      final uploadTask = ImageRef.putFile(File(image!));
      var downloadURL = '';

      await uploadTask.whenComplete(() async {
        downloadURL = await ImageRef.getDownloadURL();
        print('Profile Picture uploaded to Firebase Storage');
        return downloadURL;
      });
      return downloadURL;
    } catch (e) {
      print('Error uploading Product image: $e');
      // Show error snackbar or toast
      // Get.snackbar('Error', 'Failed to update profile picture');
      return '';
    }
  }
}
