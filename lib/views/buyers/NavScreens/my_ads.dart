import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temp_store/constants/colors.dart';
import 'package:temp_store/controllers/authController.dart';
import 'package:temp_store/controllers/userController.dart';
import 'package:temp_store/views/buyers/FunctionalScreen.dart/ProductListing/product_list.dart';

import '../FunctionalScreen.dart/ProductDetails/productDetails.dart';

class MyAds extends StatelessWidget {
  const MyAds({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.appBarColor,
        title: const Text('My Phone Ads'),
      ),
      body: GetX<UserController>(
        // init: Get.put(UserController()),
        builder: (UserController controller) {
          if (controller.getAllUserPhoneAds().isNotEmpty &&
              Get.find<AuthController>().user != null) {
            return ListView.builder(
                itemCount: controller.getAllUserPhoneAds().length,
                itemBuilder: (_, int index) {
                  // List of items
                  return GestureDetector(
                    onTap: () {
                      Get.to(ProductDetailsPage(
                        phone: controller.getAllUserPhoneAds()[index],
                      ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.15,
                      margin: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 20),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // Image
                          Container(
                            width: MediaQuery.of(context).size.width * 0.32,
                            margin: const EdgeInsets.only(right: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(width: 2, color: secondary),
                              image: DecorationImage(
                                  image: NetworkImage(controller
                                          .getAllUserPhoneAds()[index]
                                          .images[0]
                                      // filterProducts[index]['image_url']
                                      ),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          // Text to Display
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                customText(
                                  controller
                                      .getAllUserPhoneAds()[index]
                                      .title
                                      .toString(),
                                  18,
                                  FontWeight.bold,
                                ),
                                customText(
                                  'PKR ${controller.getAllUserPhoneAds()[index].price.toString()}',
                                  16,
                                  FontWeight.bold,
                                ),
                                customText(
                                  controller
                                      .getAllUserPhoneAds()[index]
                                      .city
                                      .toString(),
                                  15,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    customText(
                                      controller
                                              .getAllUserPhoneAds()[index]
                                              .pta!
                                          ? 'PTA'
                                          : 'Non-PTA',
                                      13,
                                    ),
                                    const Icon(
                                      Icons.more_vert,
                                      color: secondary,
                                      size: 12,
                                    ),
                                    customText(
                                      controller
                                          .getAllUserPhoneAds()[index]
                                          .condition
                                          .toString(),
                                      13,
                                    ),
                                    const Icon(
                                      Icons.more_vert,
                                      color: secondary,
                                      size: 12,
                                    ),
                                    customText(
                                      controller.getAllUserPhoneAds()[index].storage.toString(),
                                      13,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return const Center(
              child: Text('No phone ads found.'),
            );
          }
        },
      ),
    );
  }
}
