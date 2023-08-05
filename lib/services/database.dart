import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:temp_store/controllers/authController.dart';
import 'package:temp_store/controllers/userController.dart';
import 'package:temp_store/models/sortModel.dart';
import 'package:temp_store/models/userModel.dart';
import 'package:temp_store/services/firebaseStorage.dart';

import '../models/phoneModel.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// ---------------------------------- User Collection ----------------------------------

  // Add User
  Future<bool> addNewUser(UserModel user) async {
    try {
      final userDoc = await _firestore.collection('users').doc(user.id).get();

      if (userDoc.exists) {
        print('User already exists in FireStore with ${user.id}');
        return true;
      }
      try {
        await _firestore.collection('users').doc(user.id).set({
          'name': user.name,
          'email': user.email,
          'password': user.password,
          'image': user.image,
          'phone': user.phone,
          'address': user.address,
          'phoneAds': user.phoneAds,
        });
        print('User Added Successfully to FireStore');
        return true;
      } catch (e) {
        print("Error Add User: $e");
        return false;
      }
    } catch (e) {
      print("Error Add User: $e");
      return false;
    }
  }

  // Get User Details
  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(uid).get();
      return UserModel.fromDocumentSnapshot(userDoc);
    } catch (e) {
      print("Error Get User: $e");
      rethrow;
    }
  }

  // Add Sell Phone Ad to User Profile
  Future<bool> addPhoneAdToUser(partialPhoneData) async {
    try {
      // Add it to User Profile too
      await _firestore
          .collection('users')
          .doc(Get.find<AuthController>().user!.uid)
          .update({
        'phoneAds': FieldValue.arrayUnion([partialPhoneData])
      });
      Get.find<UserController>().user!.phoneAds!.add(partialPhoneData);
      print('Phone Ad Added Successfully to User Profile in FireStore');
      return true;
    } catch (e) {
      print("Error Add Phone Ad to User Profile: $e");
      return false;
    }
  }

  // Update User Profile
  Future<bool> updateUser(UserModel user, String imageRawPath) async {
    try {
      final profileImageUrl =
          await firebaseStorage().storeUserImageFirebaseStorage(imageRawPath);

      await _firestore.collection('users').doc(user.id).update({
        'name': user.name,
        'email': user.email,
        'password': user.password,
        'image': profileImageUrl,
        'phone': user.phone,
        'address': user.address,
        'phoneAds': user.phoneAds,
      });
      Get.find<UserController>().user!.image = profileImageUrl;
      print('User Profile Updated Successfully in FireStore');
      return true;
    } catch (e) {
      print("Error Updating User Profile: $e");
      return false;
    }
  }

  // Add new Phone to PhoneAds Collection and User Profile's phoneAds Array
  Future<bool> addNewProduct(PhoneModel phone) async {
    if (Get.find<UserController>().user?.email == null ||
        Get.find<AuthController>().user?.uid == null) {
      print('User not found - Cant add product');
      return false;
    }
    final fullPhoneAdDetail = {
      'sellerID': Get.find<UserController>().user?.id,
      'sellerName': Get.find<UserController>().user?.name,
      'sellerImage': Get.find<UserController>().user?.image,
      'sellerPhone': Get.find<UserController>().user?.phone,
      'sellerAddress': Get.find<UserController>().user?.address,
      'make': phone.make,
      'title': phone.title,
      'variant': phone.variant,
      'storage': phone.storage,
      'color': phone.color,
      'location': phone.location,
      'pta': phone.pta,
      'jv': phone.jv,
      'batteryHealth': phone.batteryHealth,
      'condition': phone.condition,
      'subCondition': phone.subCondition,
      'accessories': phone.accessories,
      'sellerComment': phone.sellerComment,
      'city': phone.city,
      'featured': phone.featured,
      'isSold': phone.isSold,
      'images': phone.images,
      'price': phone.price,
      'createdAt': Timestamp.now(),
      'updatedAt': Timestamp.now(),
    };
    try {
      // Add it to PhoneAds Collection
      await _firestore
          .collection('phoneAds')
          .doc()
          .set(fullPhoneAdDetail)
          .then((_) async {
        // Add it to User Profile too
        await addPhoneAdToUser(fullPhoneAdDetail);
      });
      print('Product Added Successfully');
      return true;
    } catch (e) {
      print("Error Add Product: $e");
      return false;
    }
  }

// ---------------------------------- PhoneAds Collection ----------------------------------

  // Get All Phones Ads - according to filters and sort
  Stream<List<PhoneModel>> getAllPhoneAdsFiltered(
      Map<String, dynamic> selectedFilters, SortModel sortModel) {
    Query<Map<String, dynamic>> query = _firestore.collection('phoneAds');

    print('Selected Filters in DB: $selectedFilters');
    print(
        'Selected Sort in DB: ${sortModel.displayName} ${sortModel.sortField} ${sortModel.sortValueDescend}');

    // Apply filters to the query -----------------------------

    // Price Filter
    if (selectedFilters.containsKey('price')) {
      if (sortModel.sortField == 'createdAt') {
        query = query.orderBy('price');
      }

      // list of two variable Min and Max
      int minPrice = selectedFilters['price'][0];
      int maxPrice = selectedFilters['price'][1];
      query = query.where('price', isGreaterThanOrEqualTo: minPrice);
      query = query.where('price', isLessThanOrEqualTo: maxPrice);
      // query = query.orderBy('price');
    }

    // Condition Filter
    if (selectedFilters.containsKey('condition')) {
      String conditionFilterValue = selectedFilters['condition'] as String;
      query = query.where('condition', isEqualTo: conditionFilterValue);
      // query = query.orderBy('condition');
    }

    // PTA status Filter
    if (selectedFilters.containsKey('pta')) {
      bool ptaFilterValue = selectedFilters['pta'] as bool;
      query = query.where('pta', isEqualTo: ptaFilterValue);
      // query = query.orderBy('pta');
    }

    // Location filter
    if (selectedFilters.containsKey('location')) {
      String locationFilterValue = selectedFilters['location'] as String;
      query = query.where('city', isEqualTo: locationFilterValue);
      // query = query.orderBy('city');
    }

    // Storage Filter
    if (selectedFilters.containsKey('storage')) {
      String storageFilterValue = selectedFilters['storage'] as String;
      query = query.where('storage', isEqualTo: storageFilterValue);
      // query = query.orderBy('storage');
    }

    // Apply sorting ------------------------------------------
    // query = query.orderBy(sortModel.sortField,
    //       descending: sortModel.sortValueDescend);
    return query.snapshots().map(
          (QuerySnapshot query) => query.docs
              .map((doc) => PhoneModel.fromDocumentSnapshot(doc))
              .toList(),
        );
  }

  // Get Phone Details
  // Future<PhoneModel> getPhoneDetails(String uid) async {
  //   try {
  //     DocumentSnapshot phoneDoc =
  //         await _firestore.collection('phoneAds').doc(uid).get();
  //     print('Phones details fetched: ${phoneDoc.data()}');
  //     return PhoneModel.fromDocumentSnapshot(phoneDoc);
  //   } catch (e) {
  //     print("Error Get Product: $e");
  //     rethrow;
  //   }
  // }

  // Stream<List<PhoneModel>> getAllPhoneAds() {
  //   return _firestore
  //       .collection('phoneAds')
  //       .orderBy('createdAt', descending: true)
  //       .snapshots()
  //       .map((QuerySnapshot query) {
  //     List<PhoneModel> retVal = [];
  //     query.docs.forEach((element) {
  //       retVal.add(PhoneModel.fromDocumentSnapshot(element));
  //     });
  //     return retVal;
  //   });
  // }

  // Stream<UserModel> getCurrentUser(String uid) {
  //   return _firestore
  //       .collection('users')
  //       .doc(uid)
  //       .snapshots()
  //       .map((DocumentSnapshot userDoc) {
  //     return UserModel.fromDocumentSnapshot(userDoc);
  //   });
  // }
}
