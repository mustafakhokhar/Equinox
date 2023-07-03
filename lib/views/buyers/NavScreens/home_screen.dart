import 'package:flutter/material.dart';
import 'package:temp_store/Widgets/searchBar.dart';
import 'package:temp_store/constants/colors.dart';
import 'package:temp_store/views/buyers/HomePages/AccessoriesScreen.dart';
import 'package:temp_store/views/buyers/HomePages/LaptopScreen.dart';
import 'package:temp_store/views/buyers/HomePages/gadgetScreen.dart';
import 'package:temp_store/views/buyers/HomePages/phoneScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _screens = [
    const PhoneScreen(),
    const LaptopScreen(),
    const GadgetScreen(),
    const AccessoriesScreen(),
  ];

  final List<String> _titles = [
    "Phones",
    "Laptops",
    "Gadgets",
    "Accessories",
  ];

  int _screenIndex = 0;
  final List<bool> _colorChange = [true, false, false, false];

  @override
  Widget build(BuildContext context) {
    // Home screen container with column split blue and white
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
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.0,
                      left: 25,
                      right: 25),
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
                          children: [
                            // use list to create buttons dynamically
                            for (int i = 0; i < _titles.length; i++)
                              OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    _screenIndex = i;
                                    _colorChange[i] = true;
                                    for (int j = 0;
                                        j < _colorChange.length;
                                        j++) {
                                      if (j != i) _colorChange[j] = false;
                                    }
                                  });
                                },
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: _colorChange[i]
                                      ? CustomColors.buttonSelectedColor
                                      : CustomColors.buttonUnselectedColor,
                                  visualDensity: VisualDensity.compact,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(18))),
                                ),
                                child: Text(
                                  _titles[i],
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: _colorChange[i]
                                          ? Colors.black
                                          : Colors.white),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    HomeScreenSearchBar()
                  ]),
                ),
              ),
        ],
      ),
      body: _screens[_screenIndex],
      backgroundColor: CustomColors.appBackgroundColor,
    );
  }
}
