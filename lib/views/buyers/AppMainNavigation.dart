import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temp_store/constants/colors.dart';
import 'package:temp_store/controllers/authController.dart';
import 'package:temp_store/controllers/userController.dart';
import 'package:temp_store/views/buyers/NavScreens/chat.dart';
import 'package:temp_store/views/sellers/phoneSell.dart';
import 'package:temp_store/views/onBoardingScreens/SignIn.dart';

import '../../controllers/UIcontrollers/app_main_navigation_controller.dart';
import 'NavScreens/home_screen.dart';
import 'NavScreens/my_ads.dart';
import 'NavScreens/profile.dart';
// import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

// Main screen refers to the bottom navigation bar
// which gets redirected to the respective pages

class AppNavigationScreen extends StatelessWidget {
  AppNavigationScreen({Key? key, int? index})
      : pageCount = index,
        super(key: key);

  late int? pageCount;

  List<Map> sellItemTags = [
    {
      'title': 'Phone',
      'icon': Icons.phone_android_outlined,
      'onPress': PhoneSellNowPag()
    },
    // {
    //   'title': 'Tablet',
    //   'icon': Icons.tablet_android_outlined,
    //   'onPress': PhoneSellNowPage()
    // },
    // {
    //   'title': 'Watch',
    //   'icon': Icons.watch_outlined,
    //   'onPress': PhoneSellNowPage()
    // },
    // {
    //   'title': 'Laptop',
    //   'icon': Icons.laptop_outlined,
    //   'onPress': PhoneSellNowPage()
    // },
    // {
    //   'title': 'Accessories',
    //   'icon': Icons.headset_outlined,
    //   'onPress': PhoneSellNowPage()
    // },
  ];

  @override
  Widget build(BuildContext context) {
    // Init Home Contoller
    var navController = Get.put(AppNavigationController());

    final List<Widget> navBarPage = [
      const HomeScreen(),
      const MyAds(),
      const chatScreen(),
      // SignInScreen(),
      const ProfilePage(),
    ];

    final navBarItem = [
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.home_outlined,
          ),
          label: 'Home'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.campaign_outlined), label: 'My Ads'),
      const BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Sell'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.storefront_outlined), label: 'chat'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.manage_accounts_outlined), label: 'Profile'),
    ];

    ValidUserNavigation() {
      if (navController.currentNavIndex.value == 2) {
        // print('Page 2');
        if (Get.find<AuthController>().user?.uid == null) {
          // print('NOT Found1: ${Get.find<AuthController>().user?.uid}');
          // print('NOT Found2: ${Get.find<UserController>().user?.name}');
          return SignInScreen(
            title: 'Oops..\n You\'re not Logged In',
          );
        } else {
          print('User Found AuthC: ${Get.find<AuthController>().user?.uid}');
          print('User Found UserC: ${Get.find<UserController>().user?.name}');
        }
        return navBarPage[navController.currentNavIndex.value];
      } else {
        return navBarPage[navController.currentNavIndex.value];
      }
    }

    navController.currentNavIndex.value = pageCount ?? 0;

    return Scaffold(
      body: Obx(() => navBarPage[navController.currentNavIndex.value]),
      bottomNavigationBar: Obx(
        () => AnimatedBottomNavigationBar(
          notchMargin: 0,
          icons: const [
            Icons.home_outlined,
            Icons.campaign_outlined,
            CupertinoIcons.chat_bubble_2,
            CupertinoIcons.person,
          ],
          activeIndex: navController.currentNavIndex.value,
          backgroundColor: Colors.white,
          activeColor: CustomColors.appBarColor,
          inactiveColor: Colors.grey,
          gapLocation: GapLocation.center,
          borderColor: CustomColors.appBackgroundColor,
          onTap: (value) {
            navController.currentNavIndex.value = value;
          },
        ),
        //     BottomNavigationBar(
        //   type: BottomNavigationBarType.fixed,
        //   currentIndex: navController.currentNavIndex.value,
        //   unselectedItemColor: Colors.grey,
        //   selectedItemColor: CustomColors.appBarColor,
        //   selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        //   items: navBarItem,
        //   backgroundColor: Colors.white,
        //   onTap: (value) {
        //     navController.currentNavIndex.value = value;
        //   },
        // ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (Get.find<AuthController>().user?.uid == null) {
            Get.to(() => SignInScreen(
                  title: 'Oops..\n You\'re not Logged In',
                ));
          } else {
            print('Add clicked');
            // PhoneModel temp = PhoneModel(
            //   sellerID: Get.find<AuthController>().user?.uid,
            //   sellerAddress: 'Khalid Bin Waleed Road, Karachi',
            //   sellerName: 'Muhammad Ali',
            //   sellerPhone: '03001234567',
            //   sellerImage: 'https://i.imgur.com/BoN9kdC.png',
            //   make: 'Apple',
            //   title: 'iPhone 14 Pro Max',
            //   location: 'Khalid Bin Waleed Road, Karachi',
            //   variant: 'LLA',
            //   storage: '128',
            //   color: 'gold',
            //   pta: true,
            //   jv: false,
            //   batteryHealth: '100%',
            //   condition: 'New',
            //   subCondition: 'Kit',
            //   accessories: {},
            //   sellerComment: 'No Comment',
            //   city: 'Karachi',
            //   featured: false,
            //   isSold: false,
            //   images: null,
            //   price: 120,
            // );
            // Database().addNewProduct(temp);
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
                  const ListTile(
                    leading: Icon(CupertinoIcons.tag_solid),
                    title: Text('What do you want to sell?'),
                  ),
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: sellItemTags.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          print('Selected: ${sellItemTags[index]['title']}');
                          Get.back();
                          Get.to(sellItemTags[index]['onPress']);
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                sellItemTags[index]['icon'],
                                color: primary,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                sellItemTags[index]['title'],
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
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
        },
        backgroundColor: secondary,
        child: const Icon(CupertinoIcons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
