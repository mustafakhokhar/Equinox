import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temp_store/constants/colors.dart';
import 'package:temp_store/constants/iconPath.dart';
import 'package:temp_store/controllers/UIcontrollers/product_details_controller.dart';
import 'package:temp_store/controllers/phoneListingController.dart';
import 'package:temp_store/models/phoneModel.dart';
import 'package:temp_store/views/buyers/HomePages/phoneScreen.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({Key? key, required phone})
      : phoneDets = phone,
        super(key: key);

  final PhoneModel phoneDets;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductDetailsController());

    controller.phoneDetails = phoneDets;
    print(controller.phoneDetails!.title);

    return Obx(() => Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: primary,
                expandedHeight: MediaQuery.of(context).size.height * 0.31,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  centerTitle: false,
                  titlePadding: const EdgeInsets.only(left: 50, bottom: 15),
                  title: Text(
                    phoneDets.title!,
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.transparent),
                  ),
                  background: SafeArea(
                    child: Obx(
                      () {
                        if (controller.isLoading.value) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          if (controller.isError.value) {
                            return Center(
                              child: Container(
                                padding: const EdgeInsets.all(10.0),
                                child: const Text('Error Occurred'),
                              ),
                            );
                          } else {
                            return CarouselSlider(
                              options: CarouselOptions(
                                autoPlay: true,
                                enlargeCenterPage: true,
                                viewportFraction: 1,
                                aspectRatio: 3 / 2,
                              ),
                              items: controller.listProductDetails.map((item) {
                                return ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5.0)),
                                  child: CachedNetworkImage(
                                    imageUrl: item['image_thumbnail_path'],
                                    fit: BoxFit.cover,
                                    width: Get.width,
                                    // color: Colors.red,
                                  ),
                                );
                              }).toList(),
                            );
                          }
                        }
                      },
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(
                    top: 0, left: 15, right: 15, bottom: 100),
                sliver: SliverList(
                    delegate: SliverChildListDelegate([
                  // Product Details
                  // Title
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 5),
                    child: Text(
                      controller.phoneDetails!.title.toString(),
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  // Price
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      "PKR: ${controller.phoneDetails!.price.toString()} ",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Location
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      controller.phoneDetails!.city.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            const Icon(
                              Icons.fact_check_outlined,
                              color: primary,
                            ),
                            Text(
                                controller.phoneDetails!.condition!.toString()),
                          ],
                        ),
                        Column(
                          children: [
                            const Icon(
                              Icons.fact_check_outlined,
                              color: primary,
                            ),
                            Text(controller.phoneDetails!.pta!
                                ? "PTA Approved"
                                : "Non PTA"),
                          ],
                        ),
                        Column(
                          children: [
                            const Icon(
                              Icons.storage_outlined,
                              color: primary,
                            ),
                            Text("${controller.phoneDetails!.storage!} GB"),
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset(
                              icIphone,
                              height: 27,
                              width: 27,
                            ),
                            Text(controller.phoneDetails!.subCondition!
                                .toString()),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const ProductDetailsListView(),
                  // const AdsPlaceHolder(),

                  // Seller's Comments
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'Seller\'s Comment',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        controller.phoneDetails!.sellerComment.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      )),
                  const Divider(
                    thickness: 1,
                  ),

                  // Seller Details
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'Seller Details',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // Seller Details like name, location, verified logo, shop image
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                controller.phoneDetails!.sellerName.toString(),
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            RichText(
                              text: const TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.location_on_outlined,
                                      color: primary,
                                      size: 16,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Location:",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: primary3,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              controller.phoneDetails!.sellerAddress.toString(),
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.left,
                              // overflow: TextOverflow.ellipsis,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                'Member since 2021',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: GestureDetector(
                                onTap: () {
                                  print('Sellers Profile');
                                },
                                child: Text(
                                  'View Seller\'s Profile',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blue[800],
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        // color: Colors.amber,
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.15,
                        // color: Colors.amber,
                        child: controller.phoneDetails!.sellerImage == null
                            ? const Image(
                                image: AssetImage(icKitPhone),
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                controller.phoneDetails!.sellerImage.toString(),
                                fit: BoxFit.cover,
                              )
                      )
                    ],
                  ),

                  // Report this ad
                  const Divider(
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: GestureDetector(
                      onTap: () {
                        print('Report this ad');
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.flag_outlined,
                            color: primary,
                          ),
                          Text(
                            '  Report this ad',
                            style: TextStyle(
                              fontSize: 16,
                              color: primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                  ),

                  // Ads
                  const AdsPlaceHolder(),
                  const AdsPlaceHolder(),

                  // Similar Ads
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'Similar Ads',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Featured images carousel
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[300],
                            ),
                            child: const Center(
                              child: Text('Image'),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ])),
              )
            ],
          ),
          // bottomNavigationBar: Column(
          //   children: [TextButton(onPressed: () {}, child: Text('Call'))],
          // ),
        ));
  }
}

class ProductDetailsListView extends StatelessWidget {
  const ProductDetailsListView({super.key});

  ProductDetailsController get controller => Get.find();

  @override
  Widget build(BuildContext context) {
    List details = [
      {
        'title': 'Make',
        'value': controller.phoneDetails!.make.toString(),
      },
      {
        'title': 'PTA Status',
        'value': controller.phoneDetails!.pta! ? 'PTA Approved' : 'Non PTA',
      },
      {
        'title': 'Gevey Sim (JV)',
        'value': controller.phoneDetails!.jv! ? 'JV sim' : 'Non JV (official)',
      },
      {
        'title': 'Battery Health',
        'value': controller.phoneDetails!.batteryHealth.toString(),
      },
      {
        'title': 'Variant',
        'value': controller.phoneDetails!.variant,
      },
      {
        'title': 'Color',
        'value': controller.phoneDetails!.color.toString(),
      },
      {
        'title': 'Storage',
        'value': '${controller.phoneDetails!.storage.toString()} GB'
      },
      {
        'title': 'Condition',
        'value': controller.phoneDetails!.condition.toString(),
      },
      {
        'title': 'Extra Details',
        'value': controller.phoneDetails!.subCondition.toString(),
      },
      {
        'title': 'Ad ID',
        'value': 'find Ad ID',
      },
    ];
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: details.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              const Divider(
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      details[index]['title'],
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                    Text(
                      details[index]['value'],
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
              ),
            ],
          );
        });
  }
}
