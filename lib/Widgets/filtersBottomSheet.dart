import 'package:csv/csv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:temp_store/constants/colors.dart';
import 'package:temp_store/controllers/phoneListingController.dart';
import 'package:temp_store/models/sortModel.dart';

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

void showPTABottomSheet() {
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
                  Get.find<PhoneListingController>().removeFilter('pta');
                  Get.back();
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
                  Get.find<PhoneListingController>().applyFilter('pta', true);
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
                  Get.find<PhoneListingController>().applyFilter('pta', false);
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

void showConditionBottomSheet() {
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
                  Get.find<PhoneListingController>().removeFilter('condition');
                  Get.back();
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
                  Get.find<PhoneListingController>()
                      .applyFilter('condition', 'New');
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
                  Get.find<PhoneListingController>()
                      .applyFilter('condition', 'Used');
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
            // ListTile(
            //   tileColor: primary,
            //   onTap: () {
            //     Get.find<PhoneListingController>()
            //         .applyFilter('storage', _storageList[index]);
            //     Get.back();
            //   },
            //   title: Text(_storageList[index]),
            // );
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

void showLocationBottomSheet() {
  List<String> locations = [];

  // Get data CSV and convert to List<String>
  Future<void> _loadCSV() async {
    try {
      final rawData = await rootBundle.loadString("assets/City.csv");
      List<List<dynamic>> listData =
          const CsvToListConverter().convert(rawData);
      for (final d in listData) {
        locations.add(d[0].toString());
      }
      Get.find<PhoneListingController>().allLocations['location'] = locations;
      // print(_locations);
    } catch (e) {
      // Handle any potential errors, e.g., file not found or parsing error.
      print("Error loading CSV: $e");
    }
  }

  _loadCSV();

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
                  title: Text('Location'),
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.find<PhoneListingController>().removeFilter('location');
                  Get.back();
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
              Get.find<PhoneListingController>().allLocations['location'] =
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
                  Get.find<PhoneListingController>().allLocations['location'];
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
                          // print(selectedLocations[index]);
                          Get.find<PhoneListingController>().applyFilter(
                              'location', selectedLocations[index]);
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
