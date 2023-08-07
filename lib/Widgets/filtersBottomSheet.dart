import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temp_store/constants/colors.dart';
import 'package:temp_store/controllers/UIcontrollers/bottomSheetDataController.dart';
import 'package:temp_store/controllers/phoneListingController.dart';
import 'package:temp_store/controllers/sellPageController.dart';
import 'package:temp_store/models/sortModel.dart';
import 'package:temp_store/services/localStorage.dart';

void showPriceBottomSheet() {
  TextEditingController filterControllerMin = TextEditingController();
  TextEditingController filterControllerMax = TextEditingController();

  Get.bottomSheet(Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
    ),
    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(
          indent: Get.width * 0.40,
          thickness: 4,
          endIndent: Get.width * 0.40,
        ),
        Row(
          children: [
            const Expanded(
              child: ListTile(
                leading: Icon(CupertinoIcons.tag_solid),
                title: Text('Price (PKR)'),
              ),
            ),
            TextButton(
                onPressed: () {
                  Get.find<PhoneListingController>().removeFilter('price');
                  Get.back();
                },
                child: const Text('clear'))
          ],
        ),
        Obx(
          () => Row(
            children: [
              Expanded(
                flex: 2,
                child: TextField(
                  controller: filterControllerMin,
                  decoration: InputDecoration(
                    labelText: Get.find<PhoneListingController>()
                                .selectedFilters
                                .containsKey('price') ==
                            true
                        ? '${Get.find<PhoneListingController>().selectedFilters['price'][0]} PKR'
                        : 'Minimum',
                    hintText: 'Minimum',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const Expanded(
                  flex: 1,
                  child: Center(
                      child: Text(
                    'To',
                    style: TextStyle(fontSize: 18),
                  ))),
              Expanded(
                flex: 2,
                child: TextField(
                  controller: filterControllerMax,
                  decoration: InputDecoration(
                    labelText: Get.find<PhoneListingController>()
                                .selectedFilters
                                .containsKey('price') ==
                            true
                        ? '${Get.find<PhoneListingController>().selectedFilters['price'][1]} PKR'
                        : 'Maxmimum',
                    hintText: 'Maxmimum',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            String filterInputMin = filterControllerMin.text;
            String filterInputMax = filterControllerMax.text;
            if (filterInputMin.isNotEmpty && filterInputMax.isNotEmpty) {
              Get.find<PhoneListingController>().applyFilter('price',
                  [int.parse(filterInputMin), int.parse(filterInputMax)]);
            }
            Get.back();
          },
          child: const Text('Apply'),
        ),
      ],
    ),
  ));
}

void showPTABottomSheet(identifier) {
  Get.bottomSheet(Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
    ),
    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(
          indent: Get.width * 0.40,
          thickness: 4,
          endIndent: Get.width * 0.40,
        ),
        Row(
          children: [
            const Expanded(
              child: ListTile(
                leading: Icon(CupertinoIcons.checkmark_seal_fill),
                title: Text('PTA Status'),
              ),
            ),
            TextButton(
                onPressed: () {
                  if (identifier == 'viewPage') {
                    Get.find<PhoneListingController>().removeFilter('pta');
                    Get.back();
                  } else if (identifier == 'sellPage') {
                    Get.back();
                    Get.snackbar('Invalid', 'Please select PTA status',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                        margin: const EdgeInsets.all(10),
                        borderRadius: 10,
                        duration: const Duration(seconds: 2));
                  }
                },
                child: const Text('clear'))
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: ElevatedButton(
                onPressed: () {
                  if (identifier == 'viewPage') {
                    Get.find<PhoneListingController>().applyFilter('pta', true);
                  } else if (identifier == 'sellPage') {
                    Get.find<SellPageController>().sellFieldData['pta'] = true;
                  }
                  Get.back();
                },
                child: const Text('PTA Approved'),
              ),
            ),
            const Expanded(
                flex: 1,
                child: Center(
                    child: Text(
                  'OR',
                  style: TextStyle(fontSize: 18),
                ))),
            Expanded(
              flex: 2,
              child: ElevatedButton(
                onPressed: () {
                  if (identifier == 'viewPage') {
                    Get.find<PhoneListingController>()
                        .applyFilter('pta', false);
                  } else if (identifier == 'sellPage') {
                    Get.find<SellPageController>().sellFieldData['pta'] = false;
                  }
                  Get.back();
                },
                child: const Text('Non-PTA'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    ),
  ));
}

void showConditionBottomSheet(identifier) {
  Get.bottomSheet(Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
    ),
    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(
          indent: Get.width * 0.40,
          thickness: 4,
          endIndent: Get.width * 0.40,
        ),
        Row(
          children: [
            const Expanded(
              child: ListTile(
                leading: Icon(CupertinoIcons.device_phone_portrait),
                title: Text('Device Condition'),
              ),
            ),
            TextButton(
                onPressed: () {
                  if (identifier == 'viewPage') {
                    Get.find<PhoneListingController>()
                        .removeFilter('condition');
                    Get.back();
                  } else if (identifier == 'sellPage') {
                    Get.back();
                    Get.snackbar('Invalid', 'Please Mention Condition',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                        margin: const EdgeInsets.all(10),
                        borderRadius: 10,
                        duration: const Duration(seconds: 2));
                  }
                },
                child: const Text('clear'))
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: ElevatedButton(
                onPressed: () {
                  if (identifier == 'viewPage') {
                    Get.find<PhoneListingController>()
                        .applyFilter('condition', 'New');
                  } else if (identifier == 'sellPage') {
                    Get.find<SellPageController>().sellFieldData['condition'] =
                        'New';
                  }
                  Get.back();
                },
                child: const Text('New'),
              ),
            ),
            const Expanded(
                flex: 1,
                child: Center(
                    child: Text(
                  'OR',
                  style: TextStyle(fontSize: 18),
                ))),
            Expanded(
              flex: 2,
              child: ElevatedButton(
                onPressed: () {
                  if (identifier == 'viewPage') {
                    Get.find<PhoneListingController>()
                        .applyFilter('condition', 'Used');
                  } else if (identifier == 'sellPage') {
                    Get.find<SellPageController>().sellFieldData['condition'] =
                        'Used';
                  }
                  Get.back();
                },
                child: const Text('Used'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    ),
  ));
}

void showStorageBottomSheet() {
  List<String> storageList = [
    '16GB',
    '32GB',
    '64GB',
    '128GB',
    '256GB',
    '512GB',
    '1TB',
    '2TB',
  ];
  Get.bottomSheet(Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
    ),
    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(
          indent: Get.width * 0.40,
          thickness: 4,
          endIndent: Get.width * 0.40,
        ),
        Row(
          children: [
            const Expanded(
              child: ListTile(
                leading: Icon(Icons.sd_storage_outlined),
                title: Text('Device Storage'),
              ),
            ),
            TextButton(
                onPressed: () {
                  Get.find<PhoneListingController>().removeFilter('storage');
                  Get.back();
                },
                child: const Text('clear'))
          ],
        ),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 00,
            mainAxisSpacing: 0,
          ),
          itemCount: storageList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              // color: primary,
              child: ListTile(
                selected: true,
                textColor: primary,
                onTap: () {
                  Get.find<PhoneListingController>()
                      .applyFilter('storage', storageList[index]);
                  Get.back();
                },
                title: Center(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(storageList[index]),
                  ),
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 20),
      ],
    ),
  ));
}

void showFilterBottomSheet() {
  Get.bottomSheet(Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
    ),
    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(
          indent: Get.width * 0.40,
          thickness: 4,
          endIndent: Get.width * 0.40,
        ),
        Row(
          children: [
            const Expanded(
              child: ListTile(
                leading: Icon(Icons.filter_list),
                title: Text('All Applied Filters'),
              ),
            ),
            TextButton(
                onPressed: () {
                  Get.find<PhoneListingController>().clearAllFilters();
                },
                child: const Text('Clear All'))
          ],
        ),
        Obx(() => Get.find<PhoneListingController>().selectedFilters.isNotEmpty
            ? SingleChildScrollView(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount:
                      Get.find<PhoneListingController>().selectedFilters.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        selected: true,
                        textColor: primary,
                        onTap: () {},
                        trailing: TextButton(
                          child: const Text('clear'),
                          onPressed: () {
                            Get.find<PhoneListingController>().removeFilter(
                                Get.find<PhoneListingController>()
                                    .selectedFilters
                                    .keys
                                    .toList()[index]);
                          },
                        ),
                        title: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            Get.find<PhoneListingController>()
                                .selectedFilters
                                .keys
                                .toList()[index],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            : const Text('No Filters Applied')),
      ],
    ),
  ));
}

void showSortBottomSheet() {
  List<SortModel> sortItems = [
    SortModel(
        displayName: 'Newest First',
        sortField: 'createdAt',
        sortValueDescend: true),
    SortModel(
        displayName: 'Oldest First',
        sortField: 'createdAt',
        sortValueDescend: false),
    SortModel(
        displayName: 'Price: Low to High',
        sortField: 'price',
        sortValueDescend: false),
    SortModel(
        displayName: 'Price: High to Low',
        sortField: 'price',
        sortValueDescend: true),
  ];

  SortModel sort = Get.find<PhoneListingController>().sortModel;

  Get.bottomSheet(Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
    ),
    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(
          indent: Get.width * 0.40,
          thickness: 4,
          endIndent: Get.width * 0.40,
        ),
        Row(
          children: [
            const Expanded(
              child: ListTile(
                leading: Icon(Icons.filter_list),
                title: Text('Sort By'),
              ),
            ),
            TextButton(
                onPressed: () {
                  Get.find<PhoneListingController>().clearAllFilters();
                },
                child: const Text('Clear'))
          ],
        ),
        SingleChildScrollView(
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: sortItems.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: RadioListTile(
                  title: Text(sortItems[index].displayName),
                  value: sortItems[index],
                  groupValue: sort,
                  onChanged: (value) {
                    Get.find<PhoneListingController>()
                        .applySort(value as SortModel);
                    print(
                        'sortModel: ${Get.find<PhoneListingController>().sortModel.displayName}, ${Get.find<PhoneListingController>().sortModel.sortField}, ${Get.find<PhoneListingController>().sortModel.sortValueDescend}');
                  },
                ),
              );
            },
          ),
        ),
      ],
    ),
  ));
}

void showLocationBottomSheet(identifier) async {
  List<String> locations = await loadLocations();

  final TextEditingController searchController = TextEditingController();

  List<String> filterLocations(String query) {
    return locations
        .where(
            (location) => location.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  Get.bottomSheet(
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            indent: Get.width * 0.40,
            thickness: 4,
            endIndent: Get.width * 0.40,
          ),
          Row(
            children: [
              const Expanded(
                child: ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text('City'),
                ),
              ),
              TextButton(
                onPressed: () {
                  if (identifier == 'viewPage') {
                    Get.find<PhoneListingController>().removeFilter('location');
                    Get.back();
                  } else if (identifier == 'sellPage') {
                    Get.back();
                    Get.snackbar('Invalid', 'Please Select a Location',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                        margin: const EdgeInsets.all(10),
                        borderRadius: 10,
                        duration: const Duration(seconds: 2));
                  }
                },
                child: const Text('Clear'),
              )
            ],
          ),
          // Search bar
          TextField(
            controller: searchController,
            onChanged: (query) {
              List<String> filteredLocations = filterLocations(query);
              Get.find<BottomSheetsDataController>().listData['location'] =
                  filteredLocations;
            },
            decoration: InputDecoration(
              hintText: 'Search for a location...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          // List of selected locations
          Obx(
            () {
              List<String> selectedLocations =
                  Get.find<BottomSheetsDataController>().listData['location'];
              return Expanded(
                child: ListView.builder(
                  itemCount: selectedLocations.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        selected: true,
                        textColor: Colors.black,
                        onTap: () {
                          if (identifier == 'viewPage') {
                            Get.find<PhoneListingController>().applyFilter(
                                'location', selectedLocations[index]);
                          } else if (identifier == 'sellPage') {
                            Get.find<SellPageController>()
                                    .sellFieldData['city'] =
                                selectedLocations[index];
                          }
                          Get.back();
                        },
                        title: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(selectedLocations[index]),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    ),
  );
}

void showSubConditionBottomSheet(identifier) {
  List<Map> newSubConditions = [
    {
      'subCondTitle': 'Box Pack',
      'subTitle': 'New, sealed box, never used',
    },
    {
      'subCondTitle': 'Open Box',
      'subTitle': 'New, but box opened, never used',
    },
    {
      'subCondTitle': 'Kit',
      'subTitle': 'New, only Phone, No Box',
    },
  ];
  List<Map> UsedSubConditions = [
    {
      'subCondTitle': 'With Box & Accessories',
      'subTitle': 'Used, Box available, accessories available',
    },
    {
      'subCondTitle': 'With Box',
      'subTitle': 'Used, Only Box available',
    },
    {
      'subCondTitle': 'Kit',
      'subTitle': 'Used, only Phone, No Box',
    },
  ];
  List<Map> listOptions = [];
  if (Get.find<SellPageController>().sellFieldData['condition'].toString() ==
      'New') {
    listOptions = newSubConditions;
  } else {
    listOptions = UsedSubConditions;
  }
  Get.bottomSheet(
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            indent: Get.width * 0.40,
            thickness: 4,
            endIndent: Get.width * 0.40,
          ),
          Row(
            children: [
              const Expanded(
                child: ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text('Sub Condition'),
                ),
              ),
              TextButton(
                onPressed: () {
                  if (identifier == 'viewPage') {
                    // Get.find<PhoneListingController>().removeFilter('location');
                    // Get.back();
                  } else if (identifier == 'sellPage') {
                    Get.back();
                    Get.snackbar('Invalid', 'Please Select an Option',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                        margin: const EdgeInsets.all(10),
                        borderRadius: 10,
                        duration: const Duration(seconds: 2));
                  }
                },
                child: const Text('Clear'),
              )
            ],
          ),
          if (Get.find<SellPageController>().sellFieldData['condition'] !=
                  null &&
              Get.find<SellPageController>().sellFieldData['condition'] !=
                  '') ...[
            Expanded(
              child: ListView.builder(
                itemCount: listOptions.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      selected: true,
                      textColor: Colors.black,
                      onTap: () {
                        if (identifier == 'viewPage') {
                          // Get.find<PhoneListingController>().applyFilter(
                          //     'location', selectedLocations[index]);
                        } else if (identifier == 'sellPage') {
                          Get.find<SellPageController>()
                                  .sellFieldData['subCondition'] =
                              listOptions[index]['subCondTitle'];
                        }
                        Get.back();
                      },
                      title: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(listOptions[index]['subCondTitle']),
                      ),
                      subtitle: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(listOptions[index]['subTitle']),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ],
      ),
    ),
  );
}

void showAccessoriesBottomSheet(identifier) {
  List<String> accessories = [
    'Charging Cable',
    'Adapter',
    'Handsfree',
    'Data Cable',
  ];
  Get.bottomSheet(
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            indent: Get.width * 0.40,
            thickness: 4,
            endIndent: Get.width * 0.40,
          ),
          Row(
            children: [
              const Expanded(
                child: ListTile(
                  leading: Icon(Icons.headphones),
                  title: Text('Accessories'),
                ),
              ),
              TextButton(
                onPressed: () {
                  if (identifier == 'sellPage') {
                    Get.find<SellPageController>()
                        .sellFieldData['accessories'] = ['None'];
                    Get.back();
                  }
                },
                child: const Text('None'),
              )
            ],
          ),
          Obx(
            () => Wrap(
              children: List<Widget>.generate(accessories.length, (int index) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: FilterChip(
                    backgroundColor: Get.find<SellPageController>()
                                .sellFieldData['accessories']
                                ?.contains(accessories[index]) ??
                            false
                        ? secondary
                        : Colors.grey[300],
                    label: Text(accessories[index]),
                    onSelected: (selected) {
                      List accessoriesSeleted = [];
                      if (Get.find<SellPageController>()
                                  .sellFieldData['accessories'] !=
                              null &&
                          !Get.find<SellPageController>()
                              .sellFieldData['accessories']
                              .contains('None')) {
                        accessoriesSeleted = Get.find<SellPageController>()
                            .sellFieldData['accessories'];
                        if (accessoriesSeleted.contains(accessories[index])) {
                          accessoriesSeleted.remove(accessories[index]);
                        } else {
                          accessoriesSeleted.add(accessories[index]);
                        }
                        Get.find<SellPageController>()
                            .sellFieldData['accessories'] = accessoriesSeleted;
                      } else {
                        accessoriesSeleted.add(accessories[index]);
                        Get.find<SellPageController>()
                            .sellFieldData['accessories'] = accessoriesSeleted;
                      }
                    },
                    selectedColor: secondary,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    ),
  );
}

void showMakersBottomSheet(identifier) async {
  List<String> makers = await loadMakers();

  final TextEditingController searchController = TextEditingController();

  List<String> filterMakers(String query) {
    return makers
        .where(
            (location) => location.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  Get.bottomSheet(
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            indent: Get.width * 0.40,
            thickness: 4,
            endIndent: Get.width * 0.40,
          ),
          Row(
            children: [
              const Expanded(
                child: ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text('Device Brand'),
                ),
              ),
              TextButton(
                onPressed: () {
                  if (identifier == 'viewPage') {
                    Get.find<PhoneListingController>().removeFilter('make');
                    Get.back();
                  } else if (identifier == 'sellPage') {
                    Get.back();
                    Get.snackbar('Invalid', 'Please Select Brand',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                        margin: const EdgeInsets.all(10),
                        borderRadius: 10,
                        duration: const Duration(seconds: 2));
                  }
                },
                child: const Text('Clear'),
              )
            ],
          ),
          // Search bar
          TextField(
            controller: searchController,
            onChanged: (query) {
              List<String> filteredMakers = filterMakers(query);
              Get.find<BottomSheetsDataController>().listData['make'] =
                  filteredMakers;
            },
            decoration: InputDecoration(
              hintText: 'Search for Brand',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          // List of selected locations
          Obx(
            () {
              List<String> selectedLocations =
                  Get.find<BottomSheetsDataController>().listData['make'];
              return Expanded(
                child: ListView.builder(
                  itemCount: selectedLocations.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        selected: true,
                        textColor: Colors.black,
                        onTap: () {
                          if (identifier == 'viewPage') {
                            Get.find<PhoneListingController>()
                                .applyFilter('make', selectedLocations[index]);
                          } else if (identifier == 'sellPage') {
                            Get.find<SellPageController>()
                                    .sellFieldData['make'] =
                                selectedLocations[index];
                          }
                          Get.back();
                        },
                        title: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(selectedLocations[index]),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    ),
  );
}

void showDeviceModelBottomSheet(identifier) async {
  List<String> device = [
    'iPhone 12 Pro Max',
    'iPhone 12 Pro',
    'iPhone 12',
    'Samsung Galaxy S21 Ultra',
    'Samsung Galaxy S21+',
    'Samsung Galaxy S21',
    'Samsung Galaxy Note 20 Ultra',
  ];

  Get.find<BottomSheetsDataController>().listData['title'] = device;

  final TextEditingController searchController = TextEditingController();

  List<String> filterDevice(String query) {
    return device
        .where(
            (location) => location.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  Get.bottomSheet(
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            indent: Get.width * 0.40,
            thickness: 4,
            endIndent: Get.width * 0.40,
          ),
          Row(
            children: [
              const Expanded(
                child: ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text('Device Model'),
                ),
              ),
              TextButton(
                onPressed: () {
                  if (identifier == 'viewPage') {
                    Get.find<PhoneListingController>().removeFilter('title');
                    Get.back();
                  } else if (identifier == 'sellPage') {
                    Get.back();
                    Get.snackbar('Invalid', 'Please Select Brand',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                        margin: const EdgeInsets.all(10),
                        borderRadius: 10,
                        duration: const Duration(seconds: 2));
                  }
                },
                child: const Text('Clear'),
              )
            ],
          ),
          // Search bar
          TextField(
            controller: searchController,
            onChanged: (query) {
              List<String> filteredDevice = filterDevice(query);
              Get.find<BottomSheetsDataController>().listData['title'] =
                  filteredDevice;
            },
            decoration: InputDecoration(
              hintText: 'Search for Phone Model',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          // List of selected locations
          Obx(
            () {
              List<String> selectedLocations =
                  Get.find<BottomSheetsDataController>().listData['title'];
              return Expanded(
                child: ListView.builder(
                  itemCount: selectedLocations.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        selected: true,
                        textColor: Colors.black,
                        onTap: () {
                          if (identifier == 'viewPage') {
                            Get.find<PhoneListingController>()
                                .applyFilter('title', selectedLocations[index]);
                          } else if (identifier == 'sellPage') {
                            Get.find<SellPageController>()
                                    .sellFieldData['title'] =
                                selectedLocations[index];
                          }
                          Get.back();
                        },
                        title: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(selectedLocations[index]),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    ),
  );
}

void showDeviceStorageBottomSheet(identifier) async {
  List<String> storage = [
    '16GB',
    '32GB',
    '64GB',
    '128GB',
    '256GB',
    '512GB',
    '1TB',
  ];

  Get.find<BottomSheetsDataController>().listData['storage'] = storage;

  Get.bottomSheet(Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
    ),
    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(
          indent: Get.width * 0.40,
          thickness: 4,
          endIndent: Get.width * 0.40,
        ),
        Row(
          children: [
            const Expanded(
              child: ListTile(
                leading: Icon(Icons.sd_storage_outlined),
                title: Text('Device Storage'),
              ),
            ),
            TextButton(
                onPressed: () {
                  Get.find<PhoneListingController>().removeFilter('storage');
                  Get.back();
                },
                child: const Text('clear'))
          ],
        ),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 00,
            mainAxisSpacing: 0,
          ),
          itemCount:
              Get.find<BottomSheetsDataController>().listData['storage'].length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              // color: primary,
              child: ListTile(
                selected: true,
                textColor: primary,
                onTap: () {
                  Get.find<SellPageController>().sellFieldData['storage'] =
                      storage[index];
                  Get.back();
                },
                title: Center(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(Get.find<BottomSheetsDataController>()
                        .listData['storage'][index]),
                  ),
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 20),
      ],
    ),
  ));
}

void showDeviceColorBottomSheet(identifier) async {
  List<String> color = [
    'Pacific Blue',
    'Starlight',
    'Midnight Green',
    'Space Gray',
    'Silver',
    'Gold',
    'Rose Gold',
    'Black',
    'White',
  ];

  Get.find<BottomSheetsDataController>().listData['color'] = color;

  Get.bottomSheet(Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
    ),
    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(
          indent: Get.width * 0.40,
          thickness: 4,
          endIndent: Get.width * 0.40,
        ),
        Row(
          children: [
            const Expanded(
              child: ListTile(
                leading: Icon(Icons.sd_storage_outlined),
                title: Text('Device Color'),
              ),
            ),
            TextButton(
                onPressed: () {
                  Get.find<PhoneListingController>().removeFilter('storage');
                  Get.back();
                },
                child: const Text('clear'))
          ],
        ),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 00,
            mainAxisSpacing: 0,
          ),
          itemCount:
              Get.find<BottomSheetsDataController>().listData['color'].length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              // color: primary,
              child: ListTile(
                selected: true,
                textColor: primary,
                onTap: () {
                  Get.find<SellPageController>().sellFieldData['color'] =
                      color[index];
                  Get.back();
                },
                title: Center(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(Get.find<BottomSheetsDataController>()
                        .listData['color'][index]),
                  ),
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 20),
      ],
    ),
  ));
}

void showJVBottomSheet(identifier) {
  Get.bottomSheet(Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
    ),
    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(
          indent: Get.width * 0.40,
          thickness: 4,
          endIndent: Get.width * 0.40,
        ),
        Row(
          children: [
            const Expanded(
              child: ListTile(
                leading: Icon(CupertinoIcons.checkmark_seal_fill),
                title: Text('JV Status'),
              ),
            ),
            TextButton(
                onPressed: () {
                  if (identifier == 'viewPage') {
                    Get.find<PhoneListingController>().removeFilter('pta');
                    Get.back();
                  } else if (identifier == 'sellPage') {
                    Get.back();
                    Get.snackbar('Invalid', 'Please select PTA status',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                        margin: const EdgeInsets.all(10),
                        borderRadius: 10,
                        duration: const Duration(seconds: 2));
                  }
                },
                child: const Text('clear'))
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: ElevatedButton(
                onPressed: () {
                  if (identifier == 'viewPage') {
                    Get.find<PhoneListingController>().applyFilter('jv', true);
                  } else if (identifier == 'sellPage') {
                    Get.find<SellPageController>().sellFieldData['jv'] = true;
                  }
                  Get.back();
                },
                child: const Text('JV Phone'),
              ),
            ),
            const Expanded(
                flex: 1,
                child: Center(
                    child: Text(
                  'OR',
                  style: TextStyle(fontSize: 18),
                ))),
            Expanded(
              flex: 2,
              child: ElevatedButton(
                onPressed: () {
                  if (identifier == 'viewPage') {
                    Get.find<PhoneListingController>().applyFilter('jv', false);
                  } else if (identifier == 'sellPage') {
                    Get.find<SellPageController>().sellFieldData['jv'] = false;
                  }
                  Get.back();
                },
                child: const Text('Official Phone'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    ),
  ));
}

void showBatteryHealthBottomSheet(identifier) {
  TextEditingController batteryHealthTextController = TextEditingController();

  Get.bottomSheet(Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
    ),
    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(
          indent: Get.width * 0.40,
          thickness: 4,
          endIndent: Get.width * 0.40,
        ),
        Row(
          children: [
            const Expanded(
              child: ListTile(
                leading: Icon(CupertinoIcons.tag_solid),
                title: Text('Price (PKR)'),
              ),
            ),
            TextButton(
                onPressed: () {
                  Get.find<PhoneListingController>().removeFilter('price');
                  Get.back();
                },
                child: const Text('clear'))
          ],
        ),
        Obx(
          () => Row(
            children: [
              Expanded(
                flex: 2,
                child: TextField(
                  controller: batteryHealthTextController,
                  decoration: InputDecoration(
                    labelText: Get.find<SellPageController>()
                                .sellFieldData
                                .containsKey('batteryHealth') ==
                            true
                        ? '${Get.find<SellPageController>().sellFieldData['batteryHealth']} %'
                        : 'Health',
                    hintText: 'Health',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: () {
                    if (identifier == 'viewPage') {
                      Get.find<PhoneListingController>()
                          .applyFilter('batteryHealth', true);
                    } else if (identifier == 'sellPage') {
                      Get.find<SellPageController>()
                          .sellFieldData['batteryHealth'] = 'Not Available';
                    }
                    Get.back();
                  },
                  child: const Text('Not Available'),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            String textController = batteryHealthTextController.text;
            if (Get.find<SellPageController>().sellFieldData['batteryHealth'] !=
                    '' ||
                textController != '') {
              if (identifier == 'viewPage') {
                Get.find<PhoneListingController>()
                    .applyFilter('batteryHealth', textController);
              } else if (identifier == 'sellPage') {
                Get.find<SellPageController>().sellFieldData['batteryHealth'] =
                    textController;
              }
              Get.back();
            }
          },
          child: const Text('Save'),
        ),
      ],
    ),
  ));
}
