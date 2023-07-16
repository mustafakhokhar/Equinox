import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:temp_store/models/userModel.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Add User
  Future<bool> addUser(IndividualUserModel user) async {
    try {
      await _firestore.collection('users').doc().set({
        'name': user.name,
        'email': user.email,
        'password': user.password,
        'image': user.image,
        'phone': user.phone,
      });
      return true;
    } catch (e) {
      print("Error Add User: $e");
      return false;
    }
  }

  // Get User
  Future<IndividualUserModel> getUser(String uid) async {
    try {
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(uid).get();
      return IndividualUserModel.fromDocumentSnapshot(userDoc);
    } catch (e) {
      print("Error Get User: $e");
      rethrow;
    }
  }
}
