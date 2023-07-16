import 'package:get/get.dart';
import 'package:temp_store/models/userModel.dart';

class IndividualUserController extends GetxController {
  // Make UserModel (defined in models) "observable"
  final Rx<IndividualUserModel> _individualUserModel =
      IndividualUserModel().obs;

  // Getter for UserModel or way to access UserModel
  IndividualUserModel get user => _individualUserModel.value;

  // Setter for UserModel
  set user(IndividualUserModel value) => _individualUserModel.value = value;

  void clear() {
    _individualUserModel.value = IndividualUserModel();
  }
}
