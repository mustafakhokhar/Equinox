import 'package:flutter/material.dart';
import 'package:temp_store/views/buyers/NavScreens/sell_now.dart';

import 'NavScreens/chat.dart';
import 'NavScreens/home_screen.dart';
import 'NavScreens/my_ads.dart';
import 'NavScreens/profile.dart';

// Main screen refers to the bottom navigation bar
// which gets redirected to the respective pages

class MainScreenBuyer extends StatefulWidget {
  const MainScreenBuyer({super.key});

  @override
  State<MainScreenBuyer> createState() => _MainScreenBuyerState();
}

class _MainScreenBuyerState extends State<MainScreenBuyer> {
  // Bottom Navbar page Index
  int _pageIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const MyAds(),
    const SellNowPage(),
    const chatScreen(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _pageIndex,
        onTap: (value) => setState(() => _pageIndex = value),
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.campaign_outlined), label: 'My Ads'),
          // BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Sell'),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: SizedBox.shrink(),
            label: "Sell Now",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.storefront_outlined), label: 'chat'),
          BottomNavigationBarItem(
              icon: Icon(Icons.manage_accounts_outlined), label: 'Profile'),
        ],
      ),
      floatingActionButton:
          FloatingActionButton(child: const Icon(Icons.add), onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
