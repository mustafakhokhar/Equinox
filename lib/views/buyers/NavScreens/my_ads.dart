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
        title: Text('My Phone Ads'),
      ),
      body: GetX<UserController>(
        // init: Get.put(UserController()),
        builder: (UserController controller) {
          if (controller.getUserPhoneAds().isNotEmpty &&
              Get.find<AuthController>().user != null) {
            return ListView.builder(
                itemCount: controller.getUserPhoneAds().length,
                itemBuilder: (_, int index) {
                  // List of items
                  return GestureDetector(
                    onTap: () {
                      Get.to(ProductDetailsPage(
                        phone: controller.getUserPhoneAds()[index],
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
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(width: 2, color: secondary),
                              // image: DecorationImage(
                              //     image: NetworkImage(
                              //         controller.phonesAds[index].images
                              //         // filterProducts[index]['image_url']
                              //         ),
                              //     fit: BoxFit.contain),
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
                                      .getUserPhoneAds()[index]
                                      .title
                                      .toString(),
                                  18,
                                  FontWeight.bold,
                                ),
                                customText(
                                  'PKR ${controller.getUserPhoneAds()[index].price.toString()}',
                                  16,
                                  FontWeight.bold,
                                ),
                                customText(
                                  controller
                                      .getUserPhoneAds()[index]
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
                                      controller.getUserPhoneAds()[index].pta!
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
                                          .getUserPhoneAds()[index]
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
                                      '${controller.getUserPhoneAds()[index].storage.toString()} GB',
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
