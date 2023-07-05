import 'dart:math';

import 'package:get/get.dart';
import 'package:temp_store/providers/productImgProvider.dart';

class ProductDetailsController extends GetxController {
  var listProductDetails = <dynamic>[].obs;
  var isLoading = false.obs;
  var isError = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() {
    try {
      isLoading(true);
      ProductDetailsImgProvider().getImg().then((value) {
        listProductDetails.clear();
        listProductDetails.addAll(value);
        isError.value = false;
        isLoading.value = false;
      }, onError: (err) {
        print('Error: $err');
        isLoading.value = false;
        isError.value = true;
      });
    } catch (e) {
      print('Error: $e');
      isLoading.value = false;
      isError.value = true;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
