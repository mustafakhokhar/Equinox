
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temp_store/Widgets/filtersBottomSheet.dart';
import 'package:temp_store/Widgets/searchBar.dart';
import 'package:temp_store/controllers/phoneListingController.dart';
import 'package:temp_store/views/buyers/FunctionalScreen.dart/ProductDetails/productDetails.dart';

import '../../../../constants/colors.dart';

class ProductListingPage extends StatelessWidget {
  const ProductListingPage({Key? key, this.filterKey, this.filterValue})
      : super(key: key);
  final String? filterKey;
  final dynamic filterValue;

  @override
  Widget build(BuildContext context) {
    final List<FilterModel> filterList = [
      FilterModel("Sort", '', false, "sort", () {
        showSortBottomSheet();
      }),
      FilterModel("Filters", '', false, "filters", () {
        showFilterBottomSheet();
      }),
      FilterModel("Price", '', false, "price", () {
        showPriceBottomSheet();
      }),
      FilterModel("Condition", '', false, "condition", () {
        showConditionBottomSheet('viewPage');
      }),
      FilterModel("PTA", '', false, "pta", () {
        showPTABottomSheet('viewPage');
      }),
      FilterModel("Brand", '', false, "brand", () {}),
      FilterModel("Location", '', false, "location", () {
        showLocationBottomSheet('viewPage');
      }),
      FilterModel("Storage", '', false, "storage", () {
        showStorageBottomSheet();
      }),
    ];
    // Get.put(PhoneListingController());
    // Get.find<PhoneListingController>().selectedFilters.clear();
    // if (filterKey != null && filterValue != null) {
    //   Get.find<PhoneListingController>().applyFilter(filterKey, filterValue);
    // } else {
    //   Get.find<PhoneListingController>().fetchPhones();
    // }
    return Scaffold(
        backgroundColor: const Color(0xfff0f0f0),
        body: GetX<PhoneListingController>(
          init: PhoneListingController(),
          builder: (PhoneListingController controller) {
            if (controller.phonesAds != null) {
              return Stack(
                children: <Widget>[
                  // purple backdrop design and App bar
                  Container(
                    height: MediaQuery.of(context).size.height * 0.165,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            "Phones",
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.filter_list,
                              color: primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Search bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.128,
                        ),
                        HomeScreenSearchBar(),
                      ],
                    ),
                  ),
                  // Filters
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.185),
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: double.infinity,
                    // color: Colors.amber,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List<Widget>.generate(filterList.length,
                          (int index) {
                        final filterKey = filterList[index].filterKey;
                        // Sort and Filters
                        if (index >= 0 && index <= 1) {
                          return GestureDetector(
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(filterList[index].label),
                                ),
                                if (index == 1) ...[
                                  // const Icon(
                                  //   Icons.filter_list,
                                  //   color: primary,
                                  // ),
                                  Obx(() => Badge(
                                        isLabelVisible: controller
                                                .selectedFilters.isNotEmpty
                                            ? true
                                            : false,
                                        label: Text(
                                            controller
                                                    .selectedFilters.isNotEmpty
                                                ? controller
                                                    .selectedFilters.length
                                                    .toString()
                                                : '0',
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 10)),
                                        child: const Icon(Icons.filter_list,
                                            color: primary),
                                      ))
                                ] else ...[
                                  const Icon(
                                    Icons.sort,
                                    color: primary,
                                  ),
                                ]
                              ],
                            ),
                            onTap: () {
                              filterList[index].onPress();
                            },
                          );
                        }
                        // Rest of the Filters
                        if (index >= 2) {
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 7),
                            child: FilterChip(
                              backgroundColor: CustomColors.appBackgroundColor,
                              // label: Text(_filterList[index].label),
                              label: Text(Get.find<PhoneListingController>()
                                          .selectedFilters[filterKey] !=
                                      null
                                  ? '${filterList[index].label}-${Get.find<PhoneListingController>().selectedFilters[filterKey].toString()}'
                                  : filterList[index].label),
                              onSelected: (bool selected) {
                                filterList[index].onPress();
                              },
                              selected: controller.selectedFilters
                                  .containsKey(filterKey),
                              selectedColor: secondary,
                            ),
                          );
                        }
                        return Container();
                      }),
                    ),
                  ),
                  // Each Item Card
                  SafeArea(
                    child: Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.175),
                      height: MediaQuery.of(context).size.height,
                      width: double.infinity,
                      child: ListView.builder(
                          itemCount: controller.phonesAds.length,
                          itemBuilder: (_, int index) {
                            // List of items
                            return GestureDetector(
                              onTap: () {
                                Get.to(ProductDetailsPage(
                                  phone: controller.phonesAds[index],
                                ));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                ),
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 20),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    // Image
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.32,
                                      margin: const EdgeInsets.only(right: 15),
                                      decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            width: 2, color: secondary),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          customText(
                                            controller.phonesAds[index].title
                                                .toString(),
                                            18,
                                            FontWeight.bold,
                                          ),
                                          customText(
                                            'PKR ${controller.phonesAds[index].price.toString()}',
                                            16,
                                            FontWeight.bold,
                                          ),
                                          customText(
                                            controller.phonesAds[index].city
                                                .toString(),
                                            15,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              customText(
                                                controller.phonesAds[index].pta!
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
                                                    .phonesAds[index].condition
                                                    .toString(),
                                                13,
                                              ),
                                              const Icon(
                                                Icons.more_vert,
                                                color: secondary,
                                                size: 12,
                                              ),
                                              customText(
                                                '${controller.phonesAds[index].storage.toString()} GB',
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
                          }),
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}

Widget customText(String text, double? fsize, [fweight = FontWeight.normal]) {
  return Text(text,
      style: TextStyle(
          color: primary,
          fontSize: fsize,
          fontWeight: fweight,
          letterSpacing: .3));
}

class FilterModel {
  String label;
  String value;
  bool isSelected;
  String filterKey; // New property to identify the filter
  Function onPress;

  FilterModel(
      this.label, this.value, this.isSelected, this.filterKey, this.onPress);
}
