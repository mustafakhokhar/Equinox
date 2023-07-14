import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:temp_store/constants/colors.dart';
import 'package:temp_store/views/buyers/NavScreens/sell_now.dart';

import '../../controllers/app_main_navigation_controller.dart';
import 'NavScreens/chat.dart';
import 'NavScreens/home_screen.dart';
import 'NavScreens/my_ads.dart';
import 'NavScreens/profile.dart';

// Main screen refers to the bottom navigation bar
// which gets redirected to the respective pages

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Init Home Contoller
    var navController = Get.put(AppNavigationController());

    final List<Widget> navBarPage = [
      const HomeScreen(),
      const MyAds(),
      const SellNowPage(),
      const chatScreen(),
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

    return Scaffold(
      body: Obx(() => navBarPage[navController.currentNavIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: navController.currentNavIndex.value,
          unselectedItemColor: Colors.grey,
          selectedItemColor: CustomColors.appBarColor,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          items: navBarItem,
          backgroundColor: Colors.white,
          onTap: (value) {
            navController.currentNavIndex.value = value;
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: secondary,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
