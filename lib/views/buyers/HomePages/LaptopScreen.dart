import 'package:flutter/material.dart';
import 'package:temp_store/Widgets/headingText.dart';
import 'package:temp_store/constants/colors.dart';
import 'package:temp_store/constants/iconPath.dart';
import 'package:temp_store/constants/imagePath.dart';
import 'package:temp_store/views/buyers/HomePages/phoneScreen.dart';

class LaptopScreen extends StatefulWidget {
  const LaptopScreen({super.key});

  @override
  State<LaptopScreen> createState() => _LaptopScreenState();
}

class _LaptopScreenState extends State<LaptopScreen> {
  @override
  Widget build(BuildContext context) {
    final List Laptops = [
      {
        'section': 'Brand',
        'tabs': [
          {'title': 'Dell', 'icon': imDell, 'onPress': () {}},
          {'title': 'Razer', 'icon': imRazer, 'onPress': () {}},
          {'title': 'HP', 'icon': imHp, 'onPress': () {}},
          {'title': 'ASUS', 'icon': imAsus, 'onPress': () {}},
          {'title': 'Lenovo', 'icon': imLenovo, 'onPress': () {}},
          {'title': 'Microsoft', 'icon': imMicrosoft, 'onPress': () {}},
          {'title': 'Apple', 'icon': icAppleLogo, 'onPress': () {}},
          {'title': 'MSI', 'icon': imMSI, 'onPress': () {}},
          {'title': 'Acer', 'icon': imAcer, 'onPress': () {}},
          {'title': 'Alienare', 'icon': imAlienware, 'onPress': () {}},
          {'title': 'Huawei', 'icon': icHuaweiLogo, 'onPress': () {}},
          {'title': 'Samsung', 'icon': icSamsungLogo, 'onPress': () {}},
        ],
      },
      {
        'section': 'Category',
        'tabs': [
          {'title': 'Intel', 'icon': imIntel, 'onPress': () {}},
          {'title': 'Gaming\nLaptop', 'icon': imRTX, 'onPress': () {}},
          {'title': 'AMD', 'icon': imAMD, 'onPress': () {}},
          {'title': 'Business\nLaptop', 'icon': imLaptop, 'onPress': () {}},
          {'title': 'Macbook\nAir', 'icon': imMacbookAir, 'onPress': () {}},
          {'title': '15\' inch', 'icon': imRTX, 'onPress': () {}},
          {'title': 'Macbook\nPro', 'icon': imMacbook14, 'onPress': () {}},
          {'title': '13\' inch', 'icon': imRTX, 'onPress': () {}},
        ],
      },
      {
        'section': 'Budget',
        'tabs': [
          {'title': 'Laptops under 70k', 'icon': null, 'onPress': () {}},
          {'title': 'Laptops under 100k', 'icon': null, 'onPress': () {}},
          {'title': 'Laptops under 150k', 'icon': null, 'onPress': () {}},
          {'title': 'Laptops under 230k', 'icon': null, 'onPress': () {}},
          {'title': 'Laptops under 300k', 'icon': null, 'onPress': () {}},
          {'title': 'Laptops under 400k', 'icon': null, 'onPress': () {}},
          {'title': 'Laptops under 500k', 'icon': null, 'onPress': () {}},
          {'title': 'Laptops under 700k', 'icon': null, 'onPress': () {}},
        ],
      },
      {
        'section': 'OS',
        'tabs': [
          {'title': 'Windows', 'icon': imWindows, 'onPress': () {}},
          {'title': 'MacOS', 'icon': icAppleLogo, 'onPress': () {}},
          {'title': 'Linux', 'icon': imLinux, 'onPress': () {}},
          {'title': 'Chrome OS', 'icon': imChromeOS, 'onPress': () {}},
          {'title': 'Android', 'icon': icAndroid, 'onPress': () {}},
        ],
      },
    ];

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
      itemCount: 8,
      itemBuilder: (context, index) {
        switch (index) {
          case 0:
            return Container(
              height: MediaQuery.of(context).size.height * 0.4,
              color: Colors.transparent,
              child: DefaultTabController(
                length: Laptops.length,
                child: Scaffold(
                  appBar: AppBar(
                    titleSpacing: 0,
                    elevation: 0,
                    backgroundColor: CustomColors.appBackgroundColor,
                    title: const HeadingText(
                      text: 'Browse Laptops',
                      linkString: 'All Laptops',
                    ),

                    // TAB Options
                    bottom: TabBar(
                      isScrollable: true,
                      unselectedLabelColor:
                          CustomColors.tabUnSelectedLabelColor,
                      labelColor: CustomColors.tabLabelColor,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: CustomColors.buttonUnselectedColor,
                      ),
                      tabs: List.generate(
                        Laptops.length,
                        (index) => Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              Laptops[index]['section'],
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.038,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  backgroundColor: CustomColors.appBackgroundColor,
                  // Grid View of the tabs
                  body: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 10, 0, 10),
                    child: TabBarView(
                      children: [
                        MainGrid(
                          tabs: Laptops,
                          index: 0,
                          crossAxisCount: 2,
                          childAspectRatio: MediaQuery.of(context).size.width *
                              2.8 /
                              (MediaQuery.of(context).size.height),
                        ),
                        MainGrid(
                          tabs: Laptops,
                          index: 1,
                          crossAxisCount: 2,
                          childAspectRatio: MediaQuery.of(context).size.width *
                              2.8 /
                              (MediaQuery.of(context).size.height),
                        ),
                        MainGridText(
                          tabs: Laptops,
                          index: 2,
                        ),
                        MainGrid(
                          tabs: Laptops,
                          index: 3,
                          crossAxisCount: 2,
                          childAspectRatio: MediaQuery.of(context).size.width *
                              2 /
                              (MediaQuery.of(context).size.height),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          case 1:
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              height: MediaQuery.of(context).size.height * 0.36,
              child: Column(
                children: [
                  const HeadingText(
                    text: 'Equinox\'s Offerings',
                    linkString: '',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.12,
                        child: Column(
                          children: [
                            const ListTile(
                              title: Text('SELL IT FOR ME'),
                              subtitle: Text('We sell your gadgets for you!'),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: secondary,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Hassel Free',
                                  style: TextStyle(
                                    color: CustomColors.buttonUnselectedColor,
                                  ),
                                ),
                                const Icon(
                                  Icons.more_vert,
                                  color: secondary,
                                  size: 12,
                                ),
                                Text(
                                  'Secure',
                                  style: TextStyle(
                                    color: CustomColors.buttonUnselectedColor,
                                  ),
                                ),
                                const Icon(
                                  Icons.more_vert,
                                  color: secondary,
                                  size: 12,
                                ),
                                Text(
                                  'Best Price',
                                  style: TextStyle(
                                    color: CustomColors.buttonUnselectedColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: const ListTile(
                            title: Text('BUY IT FOR ME'),
                            subtitle: Text('We buy your gadgets for you!'),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: secondary,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: const ListTile(
                            title: Text('REPAIR IT FOR ME'),
                            subtitle: Text('We repair your gadgets for you!'),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: secondary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          case 2:
            return const AdsPlaceHolder();
          case 3:
            return Container(
              color: const Color.fromARGB(0, 0, 0, 0),
              height: MediaQuery.of(context).size.height * 0.4,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: HeadingText(text: 'Featured Laptops'),
                  ),
                  Expanded(
                    child: FeaturedProductCarousel(tabs: Laptops),
                  ),
                ],
              ),
            );
          case 4:
            return Container(
              color: Colors.transparent,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: HeadingText(text: 'Laptops Listing'),
                  ),
                  Expanded(
                    child: NormalProductCarousel(tabs: Laptops),
                  ),
                ],
              ),
            );
          case 5:
            return const YoutubeWidget();
          case 6:
            return const AdsPlaceHolder();
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
