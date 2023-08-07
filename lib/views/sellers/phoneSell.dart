import 'dart:io';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:temp_store/Widgets/filtersBottomSheet.dart';
import 'package:temp_store/constants/colors.dart';
import 'package:temp_store/controllers/sellPageController.dart';

class PhoneSellNowPag extends StatelessWidget {
  PhoneSellNowPag({super.key});
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    // Variables
    List<Map> sellComponents = [
      {
        'title': 'Brand',
        'subtitle': '',
        'key': 'make',
        'trailing': Icons.arrow_drop_down,
        'onPress': () {
          showMakersBottomSheet('sellPage');
        }
      },
      {
        'title': 'Device Name',
        'key': 'title',
        'subtitle': '',
        'trailing': Icons.arrow_drop_down,
        'onPress': () {
          showDeviceModelBottomSheet('sellPage');
        }
      },
      {
        'title': 'Storage',
        'key': 'storage',
        'subtitle': '',
        'trailing': Icons.arrow_drop_down,
        'onPress': () {
          showDeviceStorageBottomSheet('sellPage');
        }
      },
      {
        'title': 'Color',
        'key': 'color',
        'subtitle': '',
        'trailing': Icons.arrow_drop_down,
        'onPress': () {
          showDeviceColorBottomSheet('sellPage');
        }
      },
      {
        'title': 'Battery Health %',
        'key': 'batteryHealth',
        'subtitle': '',
        'trailing': Icons.arrow_drop_down,
        'onPress': () {
          showBatteryHealthBottomSheet('sellPage');
        }
      },
      {
        'title': 'PTA Status',
        'key': 'pta',
        'subtitle': '',
        'trailing': Icons.arrow_drop_down,
        'onPress': () {
          showPTABottomSheet('sellPage');
        }
      },
      {
        'title': 'Is Your Phone Gevey(JV)',
        'key': 'jv',
        'subtitle': '',
        'trailing': Icons.arrow_drop_down,
        'onPress': () {
          showJVBottomSheet('sellPage');
        }
      },
      {
        'title': 'Condition',
        'key': 'condition',
        'subtitle': '',
        'trailing': Icons.arrow_drop_down,
        'onPress': () {
          showConditionBottomSheet('sellPage');
        }
      },
      {
        'title': 'Sub Condition',
        'key': 'subCondition',
        'subtitle': '',
        'trailing': Icons.arrow_drop_down,
        'onPress': () {
          showSubConditionBottomSheet('sellPage');
        }
      },
      {
        'title': 'Accessories',
        'key': 'accessories',
        'subtitle': '',
        'trailing': Icons.arrow_drop_down,
        'onPress': () {
          showAccessoriesBottomSheet('sellPage');
        }
      },
      {
        'title': 'City',
        'key': 'city',
        'subtitle': '',
        'trailing': Icons.arrow_drop_down,
        'onPress': () {
          showLocationBottomSheet('sellPage');
        }
      },
      {
        'title': 'Location',
        'key': 'location',
        'subtitle': 'G123 Amma Tower Saddar',
        'trailing': Icons.arrow_drop_down,
        'onPress': () {}
      },
      {
        'title': 'Price',
        'key': 'price',
        'subtitle': '480000',
        'trailing': Icons.arrow_drop_down,
        'onPress': () {}
      },
      {
        'title': 'Description',
        'key': 'sellerComment',
        'subtitle': '',
        'trailing': Icons.arrow_drop_down,
        'onPress': () {}
      },
      {
        'title': '',
        'subtitle': '',
        'key': 'images',
        'trailing': Icons.arrow_drop_down,
        'onPress': () {}
      },
    ];
    // Functions
    bool checkAllRequiredFieldsSelected() {
      for (var component in sellComponents) {
        if (Get.find<SellPageController>().sellFieldData[component['key']] ==
                null ||
            Get.find<SellPageController>().sellFieldData[component['key']] ==
                '') {
          return false;
        }
      }
      return true;
    }

    // Code
    return Scaffold(
        appBar: AppBar(
          title: const Text('Post Ad'),
          backgroundColor: CustomColors.appBarColor,
          actions: [
            TextButton(
              onPressed: () {
                if (_formKey.currentState?.saveAndValidate() ?? false) {
                  // Form is valid. Perform the necessary actions.
                  Get.find<SellPageController>().sellFieldData['location'] =
                      _formKey.currentState!.value['location'].toString();
                  Get.find<SellPageController>().sellFieldData['price'] =
                      _formKey.currentState!.value['price'].toString();
                  Get.find<SellPageController>()
                          .sellFieldData['sellerComment'] =
                      _formKey.currentState!.value['sellerComment'].toString();

                  // Check if all required fields have been selected
                  if (!checkAllRequiredFieldsSelected()) {
                    Get.snackbar(
                      'Incomplete Post',
                      'Please fill complete details.',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.white,
                      colorText: Colors.red,
                      duration: const Duration(seconds: 1),
                    );
                    return;
                  }
                  print('Done');
                  Get.find<SellPageController>().postAd();
                } else {
                  // Form is not valid. Handle invalid form data.
                  debugPrint('Validation failed');
                  Get.snackbar(
                    'Incomplete Post',
                    'Please fill complete details.',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.white,
                    colorText: Colors.red,
                    duration: const Duration(seconds: 1),
                  );
                }
              },
              child: const Text(
                'Done',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
        // Main Body of Page
        backgroundColor: CustomColors.appBackgroundColor,
        body: GetX(
          init: Get.put(SellPageController()),
          builder: (SellPageController controller) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  // Images Container
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: double.maxFinite,
                      child: Card(
                        child: controller.sellFieldData['images'] == null ||
                                controller.sellFieldData['images'].length == 0
                            ?
                            // If no image is selected, show this
                            GestureDetector(
                                onTap: () async {
                                  await getImages();
                                },
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      CupertinoIcons.camera,
                                      size: 40,
                                      color: Colors.blueGrey,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5),
                                      child: Text(
                                        'Add Images',
                                        style:
                                            TextStyle(color: Colors.blueGrey),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            // If images are selected, show this
                            : Column(
                                children: [
                                  Expanded(
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: controller
                                          .sellFieldData['images'].length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                showImageOptionsBottomSheet(
                                                    context,
                                                    controller.sellFieldData[
                                                        'images'][index]);
                                              },
                                              child: Image.file(controller
                                                      .sellFieldData['images']
                                                  [index]),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            )
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                  const Divider(
                                    thickness: 1,
                                  ),
                                  SizedBox(
                                    child: Text(
                                        '${controller.sellFieldData['images'].length} images selected'),
                                  ),
                                  const Divider(
                                    thickness: 1,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    child: ListTile(
                                      titleAlignment:
                                          ListTileTitleAlignment.center,
                                      leading: const Icon(
                                          CupertinoIcons.camera_on_rectangle),
                                      title: const Text(
                                        'Add More Photos',
                                        style:
                                            TextStyle(color: Colors.blueAccent),
                                      ),
                                      onTap: () async {
                                        await getImages();
                                      },
                                    ),
                                  )
                                ],
                              ),
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  // Phone Details
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Phone Details'),
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: FormBuilder(
                      key: _formKey,
                      child: ListView.builder(
                          itemCount: sellComponents.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            if (index < sellComponents.length - 4) {
                              return Card(
                                elevation: 0.3,
                                shadowColor: primary,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                child: ListTile(
                                  iconColor: secondary,
                                  textColor: Get.find<SellPageController>()
                                                      .sellFieldData[
                                                  sellComponents[index]
                                                      ['key']] ==
                                              null ||
                                          Get.find<SellPageController>()
                                              .sellFieldData[
                                                  sellComponents[index]['key']]
                                              .toString()
                                              .isEmpty
                                      ? Colors.grey
                                      : primary,
                                  title: Text(sellComponents[index]['title']),
                                  subtitle: Text(
                                    Get.find<SellPageController>()
                                                    .sellFieldData[
                                                sellComponents[index]['key']] ==
                                            null
                                        ? ''
                                        :
                                        // sellComponents[index]['key'] == 'pta' ?
                                        Get.find<SellPageController>()
                                            .sellFieldData[sellComponents[index]
                                                ['key']]
                                            .toString(),
                                  ),
                                  trailing:
                                      Icon(sellComponents[index]['trailing']),
                                  onTap: sellComponents[index]['onPress'],
                                ),
                              );
                            } else if (index < sellComponents.length - 1) {
                              return Card(
                                elevation: 0.3,
                                shadowColor: primary,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: FormBuilderTextField(
                                    name:
                                        sellComponents[index]['key'].toString(),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: sellComponents[index]['title']
                                          .toString(),
                                      hintText: '',
                                    ),
                                    validator: (valueCandidate) {
                                      if (valueCandidate?.isEmpty ?? true) {
                                        return 'This field is required.';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              );
                            }
                          }),
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }

  Future getImages() async {
    final picker = ImagePicker();
    final pickedFile =
        await picker.pickMultiImage(imageQuality: 10, maxHeight: 500);
    List<XFile> xfilePick = pickedFile;

    List<File> selectedImages = [];
    if (xfilePick.isNotEmpty) {
      if (Get.find<SellPageController>().sellFieldData['images'] != null) {
        selectedImages = Get.find<SellPageController>().sellFieldData['images'];
      }

      for (var i = 0; i < xfilePick.length; i++) {
        selectedImages.add(File(xfilePick[i].path));
      }
      Get.find<SellPageController>().sellFieldData['images'] = selectedImages;
    } else {
      Get.snackbar('0 items', 'Nothing is selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
          colorText: Colors.black,
          duration: const Duration(seconds: 2));
    }
  }

  void showImageOptionsBottomSheet(context, image) {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) => CupertinoActionSheet(
              title: const Text('Choose an option'),
              actions: [
                CupertinoActionSheetAction(
                  onPressed: () {
                    showImageViewer(context, FileImage(image),
                        swipeDismissible: false, onViewerDismissed: () {
                      Get.back();
                    });
                  },
                  child: const Text('View Image'),
                ),
                CupertinoActionSheetAction(
                  onPressed: () {
                    List<File> imageList =
                        Get.find<SellPageController>().sellFieldData['images'];
                    imageList.remove(image);
                    Get.find<SellPageController>().sellFieldData['images'] =
                        imageList;
                    Get.back();
                  },
                  child: const Text('Remove Image'),
                ),
              ],
              cancelButton: CupertinoActionSheetAction(
                onPressed: () {
                  Get.back();
                },
                child: const Text('Cancel'),
              ),
            ));
  }
}
