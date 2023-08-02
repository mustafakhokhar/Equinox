import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:temp_store/models/phoneModel.dart';

class UserModel {
  String? id;
  String? name;
  String? email;
  String? password;
  String? image;
  String? phone;
  String? address;
  List<dynamic>? phoneAds = [];

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.image,
    required this.phone,
    required this.address,
    required this.phoneAds,
  });

  UserModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    id = doc.id;
    name = doc['name'];
    email = doc['email'];
    password = doc['password'];
    image = doc['image'];
    phone = doc['phone'];
    address = doc['address'];
    phoneAds = doc['phoneAds'];
  }
  // factory UserModel.fromJson(Map<String, dynamic> json) {
  //   return UserModel(
  //     id: json['id'],
  //     name: json['name'],
  //     email: json['email'],
  //     password: json['password'],
  //     image: json['image'],
  //     phone: json['phone'],
  //     address: json['address'],
  //     phoneAds: json['phoneAds'],
  //   );
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['name'] = name;
  //   return data;
  // }
}
