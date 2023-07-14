import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temp_store/constants/colors.dart';
import 'package:temp_store/constants/iconPath.dart';
import 'package:temp_store/controllers/product_details_controller.dart';
import 'package:temp_store/views/buyers/HomePages/phoneScreen.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductDetailsController());

    return Scaffold(
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
            title: const Text(
              'iPhone 14 Pro Max',
              style: TextStyle(
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
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5.0)),
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
          padding:
              const EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 100),
          sliver: SliverList(
              delegate: SliverChildListDelegate([
            // Product Details
            const Padding(
              padding: EdgeInsets.only(top: 15, bottom: 5),
              child: Text(
                'iPhone 14 Pro Max',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                'PKR 465,000',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                'Khalid Bin Waleed Road, Karachi',
                style: TextStyle(
                  fontSize: 16,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        icKitPhone,
                        height: 30,
                        width: 30,
                      ),
                      const Text('New'),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        icNewPhone,
                        height: 30,
                        width: 30,
                      ),
                      const Text('PTA Approved'),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        icOpenBox,
                        height: 30,
                        width: 30,
                      ),
                      const Text('Android'),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        icIphone,
                        height: 30,
                        width: 30,
                      ),
                      const Text('Android'),
                    ],
                  ),
                ],
              ),
            ),
            const ProductDetailsListView(),
            const Divider(
              thickness: 1,
            ),
            const AdsPlaceHolder(),

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
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla eget velit vitae libero ornare facilisis. Donec euismod, nisl eget aliquam ultricies, nisl nisl aliquet nisl, quis aliquam nisl nisl eget. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla eget velit vitae libero ornare facilisis. Donec euismod, nisl eget aliquam ultricies, nisl nisl aliquet nisl, quis aliquam nisl nisl eget.',
                  style: TextStyle(
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
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          'Asif Tech Store',
                          textAlign: TextAlign.left,
                          style: TextStyle(
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
                      const Text(
                        'Techno City Mobile Market, shop no 69 ground floor g1, Karachi',
                        style: TextStyle(
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
                  child: Image.asset(icKitPhone),
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
    ));
  }
}

class ProductDetailsListView extends StatelessWidget {
  const ProductDetailsListView({super.key});

  @override
  Widget build(BuildContext context) {
    List details = [
      {
        'title': 'Make',
        'value': 'Apple',
      },
      {
        'title': 'Condition',
        'value': 'New',
      },
      {
        'title': 'Warranty',
        'value': 'Yes',
      },
      {
        'title': 'Battery Health',
        'value': '100%',
      },
      {
        'title': 'Ad ID',
        'value': '123456789',
      },
      {
        'title': 'Ad Posted',
        'value': '1 hour ago',
      },
      {
        'title': 'Seller Name',
        'value': 'Seller Name',
      },
      {
        'title': 'Seller Number',
        'value': '03001234567',
      },
    ];
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: details.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Divider(
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //mainAxisSize: MainAxisSize.max,
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
