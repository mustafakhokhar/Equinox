import 'package:get/get.dart';

class EditProfileController extends GetxController {
  final _obj = ''.obs;

  set obj(value) => _obj.value = value;
  get imagePath => _obj.value;
}
