import 'package:cloud_firestore/cloud_firestore.dart';

class PhoneModel {
  String? sellerID;
  String? sellerName;
  String? sellerImage;
  String? sellerPhone;
  String? sellerAddress;
  String? make;
  String? title;
  String? location;
  String? variant;
  String? storage;
  String? color;
  bool? pta;
  bool? jv;
  String? batteryHealth;
  String? condition;
  String? subCondition;
  Map<String, dynamic>? accessories;
  String? sellerComment;
  int? price;
  String? city;
  String? images;
  bool? featured;
  bool? isSold;

  PhoneModel({
    required this.sellerImage,
    required this.sellerName,
    required this.sellerPhone,
    required this.sellerAddress,
    required this.sellerID,
    required this.location,
    required this.make,
    required this.title,
    required this.variant,
    required this.storage,
    required this.color,
    required this.pta,
    required this.jv,
    required this.batteryHealth,
    required this.condition,
    required this.subCondition,
    required this.accessories,
    required this.sellerComment,
    required this.price,
    required this.city,
    required this.images,
    required this.featured,
    required this.isSold,
  });

  PhoneModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    sellerID = doc.id;
    sellerName = doc['sellerName'];
    sellerImage = doc['sellerImage'];
    sellerPhone = doc['sellerPhone'];
    sellerAddress = doc['sellerAddress'];
    make = doc['make'];
    title = doc['title'];
    location = doc['location'];
    variant = doc['variant'];
    storage = doc['storage'];
    color = doc['color'];
    pta = doc['pta'] as bool?;
    jv = doc['jv'] as bool?;
    batteryHealth = doc['batteryHealth'];
    condition = doc['condition'];
    subCondition = doc['subCondition'];
    accessories = (doc['accessories'] as Map<String, dynamic>?) ?? {};
    sellerComment = doc['sellerComment'];
    price = doc['price'];
    city = doc['city'];
    images = doc['images'];
    featured = doc['featured'] as bool?;
    isSold = doc['isSold'] as bool?;
  }

  // From Map
  PhoneModel.fromMap(Map<String, dynamic> data) {
    sellerID = data['sellerID'];
    sellerName = data['sellerName'];
    sellerImage = data['sellerImage'];
    sellerPhone = data['sellerPhone'];
    sellerAddress = data['sellerAddress'];
    make = data['make'];
    title = data['title'];
    location = data['location'];
    variant = data['variant'];
    storage = data['storage'];
    color = data['color'];
    pta = data['pta'] as bool?;
    jv = data['jv'] as bool?;
    batteryHealth = data['batteryHealth'];
    condition = data['condition'];
    subCondition = data['subCondition'];
    accessories = (data['accessories'] as Map<String, dynamic>?) ?? {};
    sellerComment = data['sellerComment'];
    // price = data['price'];
    price = int.tryParse(data['price'].toString());
    city = data['city'];
    images = data['images'];
    featured = data['featured'] as bool?;
    isSold = data['isSold'] as bool?;
  }
}
