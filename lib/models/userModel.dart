import 'package:cloud_firestore/cloud_firestore.dart';

class IndividualUserModel {
  late String id;
  late String name;
  late String email;
  late String password;
  late String image;
  late String phone;

  IndividualUserModel({id, name, email, password, image = '', phone});

  IndividualUserModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    id = doc.id;
    name = doc['name'];
    email = doc['email'];
    password = doc['password'];
    image = doc['image'];
    phone = doc['phone'];
  }
}
