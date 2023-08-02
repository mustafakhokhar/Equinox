import 'dart:io';

import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:temp_store/constants/colors.dart';

// class PhoneSellNowPage extends StatefulWidget {
//   PhoneSellNowPage({super.key});

//   @override
//   State<PhoneSellNowPage> createState() => _PhoneSellNowPageState();
// }

// class _PhoneSellNowPageState extends State<PhoneSellNowPage> {
//   final picker = ImagePicker();
//   List<File> selectedImages = [];

//   List<Map> sellComponents = [
//     {
//       'title': 'Brand',
//       'subtitle': '',
//       'trailing': Icons.arrow_drop_down,
//       'onPress': () {}
//     },
//     {
//       'title': 'Device Name',
//       'subtitle': '',
//       'trailing': Icons.arrow_drop_down,
//       'onPress': () {}
//     },
//     {
//       'title': 'Storage',
//       'subtitle': '',
//       'trailing': Icons.arrow_drop_down,
//       'onPress': () {}
//     },
//     {
//       'title': 'Color',
//       'subtitle': '',
//       'trailing': Icons.arrow_drop_down,
//       'onPress': () {}
//     },
//     {
//       'title': 'Battery Health %',
//       'subtitle': '',
//       'trailing': Icons.arrow_drop_down,
//       'onPress': () {}
//     },
//     {
//       'title': 'PTA Status',
//       'subtitle': '',
//       'trailing': Icons.arrow_drop_down,
//       'onPress': () {}
//     },
//     {
//       'title': 'Is Your Phone Gevey(JV)',
//       'subtitle': '',
//       'trailing': Icons.arrow_drop_down,
//       'onPress': () {}
//     },
//     {
//       'title': 'Condition',
//       'subtitle': '',
//       'trailing': Icons.arrow_drop_down,
//       'onPress': () {}
//     },
//     {
//       'title': 'Sub Condition',
//       'subtitle': '',
//       'trailing': Icons.arrow_drop_down,
//       'onPress': () {}
//     },
//     {
//       'title': 'Accessories',
//       'subtitle': '',
//       'trailing': Icons.arrow_drop_down,
//       'onPress': () {}
//     },
//     {
//       'title': 'City',
//       'subtitle': '',
//       'trailing': Icons.arrow_drop_down,
//       'onPress': () {}
//     },
//     {
//       'title': 'Location',
//       'subtitle': 'G123 Amma Tower Saddar',
//       'trailing': Icons.arrow_drop_down,
//       'onPress': () {}
//     },
//     {
//       'title': 'Price',
//       'subtitle': '480000',
//       'trailing': Icons.arrow_drop_down,
//       'onPress': () {}
//     },
//     {
//       'title': 'Description',
//       'subtitle': '',
//       'trailing': Icons.arrow_drop_down,
//       'onPress': () {}
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Post Ad'),
//         backgroundColor: CustomColors.appBarColor,
//         actions: const [],
//       ),
//       // Main Body of Page
//       backgroundColor: CustomColors.appBackgroundColor,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 20,
//             ),
//             // Images Container
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.3,
//               width: double.maxFinite,
//               child: Card(
//                 child: selectedImages.isEmpty
//                     ?
//                     // If no image is selected, show this
//                     GestureDetector(
//                         onTap: () async {
//                           await getImages();
//                         },
//                         child: const Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(
//                               CupertinoIcons.camera,
//                               size: 40,
//                               color: Colors.blueGrey,
//                             ),
//                             Padding(
//                               padding: EdgeInsets.symmetric(vertical: 5),
//                               child: Text(
//                                 'Add Images',
//                                 style: TextStyle(color: Colors.blueGrey),
//                               ),
//                             )
//                           ],
//                         ),
//                       )
//                     // If images are selected, show this
//                     : Column(
//                         children: [
//                           Expanded(
//                             child: ListView.builder(
//                               scrollDirection: Axis.horizontal,
//                               itemCount: selectedImages.length,
//                               itemBuilder: (BuildContext context, int index) {
//                                 return Row(
//                                   children: [
//                                     GestureDetector(
//                                       onTap: () {
//                                         showImageOptionsBottomSheet(
//                                             context, selectedImages[index]);
//                                       },
//                                       child: Image.file(selectedImages[index]),
//                                     ),
//                                     const SizedBox(
//                                       width: 10,
//                                     )
//                                   ],
//                                 );
//                               },
//                             ),
//                           ),
//                           const Divider(
//                             thickness: 1,
//                           ),
//                           SizedBox(
//                             child: Text(
//                                 '${selectedImages.length} images selected'),
//                           ),
//                           const Divider(
//                             thickness: 1,
//                           ),
//                           SizedBox(
//                             width: MediaQuery.of(context).size.width * 0.6,
//                             child: ListTile(
//                               titleAlignment: ListTileTitleAlignment.center,
//                               leading: const Icon(
//                                   CupertinoIcons.camera_on_rectangle),
//                               title: const Text(
//                                 'Add More Photos',
//                                 style: TextStyle(color: Colors.blueAccent),
//                               ),
//                               onTap: () async {
//                                 await getImages();
//                               },
//                             ),
//                           )
//                         ],
//                       ),
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.02,
//             ),
//             // Phone Details
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text('Phone Details'),
//               ),
//             ),
//             const Divider(),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: ListView.builder(
//                   itemCount: sellComponents.length,
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   itemBuilder: (context, index) {
//                     if (index < sellComponents.length - 3) {
//                       return Card(
//                         elevation: 0.3,
//                         shadowColor: primary,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15)),
//                         child: ListTile(
//                           iconColor: sellComponents[index]['subtitle']?.isEmpty
//                               ? Colors.grey
//                               : primary,
//                           // tileColor: Colors.white,
//                           title: Text(sellComponents[index]['title']),
//                           subtitle: Text(sellComponents[index]['subtitle']),
//                           trailing: Icon(sellComponents[index]['trailing']),
//                           onTap: sellComponents[index]['onPress'],
//                         ),
//                       );
//                     } else {
//                       return FormBuilder(
//                         child: Card(
//                           elevation: 0.3,
//                           shadowColor: primary,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(15)),
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 20),
//                             child: FormBuilderTextField(
//                               name: sellComponents[index]['title'].toString(),
//                               decoration: InputDecoration(
//                                 border: InputBorder.none,
//                                 labelText:
//                                     sellComponents[index]['title'].toString(),
//                                 hintText: sellComponents[index]['subtitle']
//                                     .toString(),
//                               ),
//                               onChanged: (value) {
//                                 print(value);
//                               },
//                             ),
//                           ),
//                         ),
//                       );
//                     }
//                   }),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Future getImages() async {
//     final pickedFile =
//         await picker.pickMultiImage(imageQuality: 10, maxHeight: 500);
//     List<XFile> xfilePick = pickedFile;

//     setState(
//       () {
//         if (xfilePick.isNotEmpty) {
//           for (var i = 0; i < xfilePick.length; i++) {
//             selectedImages.add(File(xfilePick[i].path));
//           }
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text('Nothing is selected')));
//         }
//       },
//     );
//   }

//   void showImageOptionsBottomSheet(context, image) {
//     showCupertinoModalPopup(
//         context: context,
//         builder: (BuildContext context) => CupertinoActionSheet(
//               title: const Text('Choose an option'),
//               actions: [
//                 CupertinoActionSheetAction(
//                   onPressed: () {
//                     showImageViewer(context, FileImage(image),
//                         swipeDismissible: false, onViewerDismissed: () {
//                       Get.back();
//                     });
//                   },
//                   child: const Text('View Image'),
//                 ),
//                 CupertinoActionSheetAction(
//                   onPressed: () {
//                     setState(
//                       () {
//                         selectedImages.remove(image);
//                         Get.back();
//                       },
//                     );
//                   },
//                   child: const Text('Remove Image'),
//                 ),
//               ],
//               cancelButton: CupertinoActionSheetAction(
//                 onPressed: () {
//                   Get.back();
//                 },
//                 child: const Text('Cancel'),
//               ),
//             ));
//   }
// }

class PhoneSellNowPag extends StatelessWidget {
  const PhoneSellNowPag({super.key});

  @override
  Widget build(BuildContext context) {
    // Variables
    List<File> selectedImages = [];
    List<Map> sellComponents = [
      {
        'title': 'Brand',
        'subtitle': '',
        'trailing': Icons.arrow_drop_down,
        'onPress': () {}
      },
      {
        'title': 'Device Name',
        'subtitle': '',
        'trailing': Icons.arrow_drop_down,
        'onPress': () {}
      },
      {
        'title': 'Storage',
        'subtitle': '',
        'trailing': Icons.arrow_drop_down,
        'onPress': () {}
      },
      {
        'title': 'Color',
        'subtitle': '',
        'trailing': Icons.arrow_drop_down,
        'onPress': () {}
      },
      {
        'title': 'Battery Health %',
        'subtitle': '',
        'trailing': Icons.arrow_drop_down,
        'onPress': () {}
      },
      {
        'title': 'PTA Status',
        'subtitle': '',
        'trailing': Icons.arrow_drop_down,
        'onPress': () {}
      },
      {
        'title': 'Is Your Phone Gevey(JV)',
        'subtitle': '',
        'trailing': Icons.arrow_drop_down,
        'onPress': () {}
      },
      {
        'title': 'Condition',
        'subtitle': '',
        'trailing': Icons.arrow_drop_down,
        'onPress': () {}
      },
      {
        'title': 'Sub Condition',
        'subtitle': '',
        'trailing': Icons.arrow_drop_down,
        'onPress': () {}
      },
      {
        'title': 'Accessories',
        'subtitle': '',
        'trailing': Icons.arrow_drop_down,
        'onPress': () {}
      },
      {
        'title': 'City',
        'subtitle': '',
        'trailing': Icons.arrow_drop_down,
        'onPress': () {}
      },
      {
        'title': 'Location',
        'subtitle': 'G123 Amma Tower Saddar',
        'trailing': Icons.arrow_drop_down,
        'onPress': () {}
      },
      {
        'title': 'Price',
        'subtitle': '480000',
        'trailing': Icons.arrow_drop_down,
        'onPress': () {}
      },
      {
        'title': 'Description',
        'subtitle': '',
        'trailing': Icons.arrow_drop_down,
        'onPress': () {}
      },
    ];
    // Code
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Ad'),
        backgroundColor: CustomColors.appBarColor,
        actions: const [],
      ),
      // Main Body of Page
      backgroundColor: CustomColors.appBackgroundColor,
      body: SingleChildScrollView(
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
                child: selectedImages.isEmpty
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
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                'Add Images',
                                style: TextStyle(color: Colors.blueGrey),
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
                              itemCount: selectedImages.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        showImageOptionsBottomSheet(
                                            context, selectedImages[index]);
                                      },
                                      child: Image.file(selectedImages[index]),
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
                                '${selectedImages.length} images selected'),
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: ListTile(
                              titleAlignment: ListTileTitleAlignment.center,
                              leading: const Icon(
                                  CupertinoIcons.camera_on_rectangle),
                              title: const Text(
                                'Add More Photos',
                                style: TextStyle(color: Colors.blueAccent),
                              ),
                              onTap: () async {
                                await getImages();
                              },
                            ),
                          )
                        ],
                      ),
              ),
            ),
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
              child: ListView.builder(
                  itemCount: sellComponents.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    if (index < sellComponents.length - 3) {
                      return Card(
                        elevation: 0.3,
                        shadowColor: primary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: ListTile(
                          iconColor: sellComponents[index]['subtitle']?.isEmpty
                              ? Colors.grey
                              : primary,
                          title: Text(sellComponents[index]['title']),
                          subtitle: Text(sellComponents[index]['subtitle']),
                          trailing: Icon(sellComponents[index]['trailing']),
                          onTap: sellComponents[index]['onPress'],
                        ),
                      );
                    } else {
                      return FormBuilder(
                        child: Card(
                          elevation: 0.3,
                          shadowColor: primary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: FormBuilderTextField(
                              name: sellComponents[index]['title'].toString(),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText:
                                    sellComponents[index]['title'].toString(),
                                hintText: sellComponents[index]['subtitle']
                                    .toString(),
                              ),
                              onChanged: (value) {
                                print(value);
                              },
                            ),
                          ),
                        ),
                      );
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }

  Future getImages() async {
    final picker = ImagePicker();
    final pickedFile =
        await picker.pickMultiImage(imageQuality: 10, maxHeight: 500);
    List<XFile> xfilePick = pickedFile;

    // setState(
    //   () {
    if (xfilePick.isNotEmpty) {
      for (var i = 0; i < xfilePick.length; i++) {
        print(xfilePick[i].path);
        // selectedImages.add(File(xfilePick[i].path));
      }
    }
    // else {
    //   ScaffoldMessenger.of(context)
    //       .showSnackBar(const SnackBar(content: Text('Nothing is selected')));
    // }
    //   },
    // );
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
                    // setState(
                    //   () {
                    //     selectedImages.remove(image);
                    //     Get.back();
                    //   },
                    // );
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
