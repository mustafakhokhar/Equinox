import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temp_store/Widgets/searchBar.dart';
import 'package:temp_store/constants/colors.dart';
import 'package:temp_store/controllers/home_screen_controller.dart';
import 'package:temp_store/views/buyers/HomePages/AccessoriesScreen.dart';
import 'package:temp_store/views/buyers/HomePages/LaptopScreen.dart';
import 'package:temp_store/views/buyers/HomePages/gadgetScreen.dart';
import 'package:temp_store/views/buyers/HomePages/phoneScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const PhoneScreen(),
      const LaptopScreen(),
      const GadgetScreen(),
      const AccessoriesScreen(),
    ];

    final List<String> titles = [
      "Phones",
      "Laptops",
      "Gadgets",
      "Accessories",
    ];

    var changeColor = Get.put(HomeScreenController());

    var screenIndex = Get.put(HomeScreenController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.appBarColor,
        toolbarHeight: MediaQuery.of(context).size.height * 0.19,
        actions: [
          // The Header of the page with logo, categories, and search bar
          Container(
            color: Colors.transparent,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
              child: Column(children: [
                // LOGO placeholder
                Container(
                  color: CustomColors.placeholder,
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width,
                  child: const Center(child: Text('Equinox Logo')),
                ),
                // CATEGORIES placeholder
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Container(
                    color: Colors.transparent,
                    height: MediaQuery.of(context).size.height * 0.04,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        titles.length,
                        (index) => Obx(
                          () => OutlinedButton(
                            onPressed: () {
                              screenIndex.currentNavIndex.value = index;
                              changeColor.colorChange[
                                  screenIndex.currentNavIndex.value] = true;
                              for (int j = 0;
                                  j < changeColor.colorChange.length;
                                  j++) {
                                if (j != screenIndex.currentNavIndex.value) {
                                  changeColor.colorChange[j] = false;
                                }
                              }
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: changeColor.colorChange[index]
                                  ? CustomColors.buttonSelectedColor
                                  : CustomColors.buttonUnselectedColor,
                              visualDensity: VisualDensity.compact,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18))),
                            ),
                            child: Text(
                              titles[index],
                              style: TextStyle(
                                  fontSize: 12,
                                  color: changeColor.colorChange[index]
                                      ? Colors.black
                                      : Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                HomeScreenSearchBar()
              ]),
            ),
          ),
        ],
      ),
      body: Obx(() => screens[screenIndex.currentNavIndex.value]),
      backgroundColor: CustomColors.appBackgroundColor,
    );
  }
}
