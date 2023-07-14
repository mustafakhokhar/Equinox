import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:temp_store/Widgets/headingText.dart';
import 'package:temp_store/constants/colors.dart';
import 'package:temp_store/constants/iconPath.dart';
import 'package:temp_store/constants/imagePath.dart';

class AccessoriesScreen extends StatelessWidget {
  const AccessoriesScreen({
    Key? key,
  }) : super(key: key);

  static const tiles = [
    GridTile(2, 2),
    GridTile(2, 3),
    GridTile(2, 3),
    GridTile(2, 2),
    // GridTile(2, 2),
    // GridTile(1, 2),
    // GridTile(1, 1),
    // GridTile(3, 1),
    // GridTile(1, 1),
    // GridTile(4, 1),
  ];

  @override
  Widget build(BuildContext context) {
    final List accessoriesHeading = [
      {'title': 'Laptop\nAccessories', 'icon': imMacbookAirM2, 'onPress': () {}},
      {'title': 'Mobile\nAccessories', 'icon': icKitPhone, 'onPress': () {}},
      {'title': 'Tablet\nAccessories', 'icon': imIpadAir, 'onPress': () {}},
      {'title': 'PC\nAccessories', 'icon': icIos, 'onPress': () {}},
      {'title': 'Kit', 'icon': icKitPhone, 'onPress': () {}},
      {'title': 'Android', 'icon': icAndroid, 'onPress': () {}},
      {'title': 'With box', 'icon': icNewPhone, 'onPress': () {}},
    ];
    return Scaffold(
      backgroundColor: CustomColors.appBackgroundColor,
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        title: const HeadingText(text: 'Discover Accessories'),
        backgroundColor: CustomColors.appBackgroundColor,
      ),
      body: SingleChildScrollView(
        // physics: NeverScrollableScrollPhysics(),
        child: StaggeredGrid.count(
          crossAxisCount: 4,
          mainAxisSpacing: 0,
          crossAxisSpacing: 0,
          children: [
            ...tiles.mapIndexed((index, tile) {
              return StaggeredGridTile.count(
                  crossAxisCellCount: tile.crossAxisCount,
                  mainAxisCellCount: tile.mainAxisCount,
                  child: Card(
                      child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          accessoriesHeading[index]['icon'],
                        ),
                      ),
                      // const Text('Accessories'),
                      ListTile(
                        // dense: true,
                        visualDensity: const VisualDensity(vertical: -4),
                        title: Text(
                          accessoriesHeading[index]['title'],
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      )
                    ],
                    // ),
                  )));
            }),
          ],
        ),
      ),
    );
  }
}

class GridTile {
  const GridTile(this.crossAxisCount, this.mainAxisCount);
  final int crossAxisCount;
  final int mainAxisCount;
}
