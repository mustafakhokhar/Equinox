import 'package:flutter/material.dart';
import 'package:temp_store/constants/colors.dart';
import 'package:temp_store/constants/iconPath.dart';
import 'package:temp_store/constants/imagePath.dart';
import 'package:temp_store/views/buyers/HomePages/phoneScreen.dart';

import '../../../Widgets/headingText.dart';
import '../FunctionalScreen.dart/ProductListing/product_list.dart';

class GadgetScreen extends StatelessWidget {
  const GadgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List Gadgets = [
      {
        'section': 'Speakers',
        'tabs': [
          {'title': 'Portable Speakers', 'icon': imJBL2, 'onPress': () {}},
          {'title': 'Headphones', 'icon': imAirpodsMax, 'onPress': () {}},
          {'title': 'Wireless Earphone', 'icon': imAirpods3, 'onPress': () {}},
          {'title': 'Home theater', 'icon': imHomeTheater, 'onPress': () {}},
          {'title': 'Earphones', 'icon': imEarpphones, 'onPress': () {}},
        ],
      },
      {
        'section': 'Tablets',
        'tabs': [
          {'title': 'iPad Pro', 'icon': imIpadPro, 'onPress': () {}},
          {'title': 'iPad Air', 'icon': imIpadAir, 'onPress': () {}},
          {'title': 'iPad', 'icon': imIpad10, 'onPress': () {}},
          {'title': 'iPad Mini', 'icon': imIpadMini, 'onPress': () {}},
          {'title': 'Samsung Tab', 'icon': imSamsungTab, 'onPress': () {}},
          {'title': 'Others', 'icon': imOneplusPad, 'onPress': () {}},
        ],
      },
      {
        'section': 'Watches',
        'tabs': [
          {'title': 'Apple Watch', 'icon': imAppleWatch, 'onPress': () {}},
          {'title': 'Galaxy Watch', 'icon': imSamsungWatch, 'onPress': () {}},
          {'title': 'Others', 'icon': imWatch, 'onPress': () {}},
        ],
      },
      {
        'section': 'Others',
        'tabs': [
          {
            'title': 'Computer Device',
            'icon': icAppleLogo,
            'onPress': () {},
          },
          {'title': 'Monitors', 'icon': icSamsungLogo, 'onPress': () {}},
          {'title': 'Camera', 'icon': icHuaweiLogo, 'onPress': () {}},
          {'title': 'Chargers', 'icon': icOppoLogo, 'onPress': () {}},
          {'title': 'Power Banks', 'icon': icVivoLogo, 'onPress': () {}},
          {
            'title': 'Other Accessories',
            'icon': icXiaomiLogo,
            'onPress': () {}
          },
        ],
      },
    ];

    return DefaultTabController(
        length: Gadgets.length,
        child: Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            elevation: 0,
            backgroundColor: CustomColors.appBackgroundColor,
            title: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: HeadingText(
                text: 'Discover Gadgets',
                linkString: 'All Devices',
              ),
            ),
            // TAB Options
            bottom: TabBar(
                isScrollable: true,
                unselectedLabelColor: CustomColors.tabUnSelectedLabelColor,
                labelColor: CustomColors.tabLabelColor,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: CustomColors.buttonUnselectedColor),
                tabs: List.generate(
                  Gadgets.length,
                  (index) => Tab(
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          Gadgets[index]['section'],
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.038),
                        )),
                  ),
                )),
          ),
          backgroundColor: CustomColors.appBackgroundColor,
          // Grid View of the tabs
          body: TabBarView(
            children: List.generate(
              Gadgets.length,
              (index) => ListView(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: HeadingText(
                      text: 'Types of ${Gadgets[index]['section']} :',
                    ),
                  ),
                  // Speakers, Tablets, Watches
                  if (index != 3) ...[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.31,
                      child: Column(
                        children: [
                          Expanded(
                            child: MainGrid(
                              tabs: Gadgets,
                              index: index,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                      ),
                      child: HeadingText(
                          text: 'Featured ${Gadgets[index]['section']}'),
                    ),
                    Container(
                      color: const Color.fromARGB(0, 0, 0, 0),
                      height: MediaQuery.of(context).size.height * 0.37,
                      child: FeaturedProductCarousel(tabs: Gadgets),
                    ),
                  ],
                  // Speaker Section only
                  if (index == 0) ...[
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                      ),
                      child: HeadingText(
                        text: 'Browse More',
                        linkString: '',
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: secondary),
                      ),
                      width: double.infinity,
                      child: ListTile(
                        onTap: () {},
                        leading:
                            const Icon(Icons.bookmark_outline, color: primary),
                        title: const Text('Search by Brands'),
                        trailing: const Icon(Icons.arrow_forward_ios,
                            color: secondary),
                      ),
                    ),
                  ],
                  if (index == 3) ...[
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: OthersWidget(Gadgets: Gadgets))
                  ],
                  const AdsPlaceHolder(),
                ],
              ),
            ),
          ),
        ));
  }
}

class OthersWidget extends StatelessWidget {
  const OthersWidget({
    super.key,
    required this.Gadgets,
  });

  final List Gadgets;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: Gadgets[3]['tabs'].length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.1,
            // margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                backgroundColor: CustomColors.GridViewColor,
                elevation: 1,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Image
                  Container(
                    width: MediaQuery.of(context).size.width * 0.30,
                    margin: const EdgeInsets.only(right: 15),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Image.asset(
                      Gadgets[3]['tabs'][index]['icon'],
                      fit: BoxFit.contain,
                    ),
                  ),
                  // Text to Display
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      customText(
                        Gadgets[3]['tabs'][index]['title'],
                        18,
                        FontWeight.bold,
                      ),
                      // Row(
                      //   crossAxisAlignment:
                      //       CrossAxisAlignment.center,
                      //   mainAxisAlignment:
                      //       MainAxisAlignment.spaceBetween,
                      //   children: <Widget>[
                      //     customText(
                      //       'Power banks',
                      //       13,
                      //     ),
                      //     const Icon(
                      //       Icons.more_vert,
                      //       color: secondary,
                      //       size: 12,
                      //     ),
                      //   ],
                      // )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}

class MainGrid extends StatelessWidget {
  const MainGrid({
    Key? key,
    required List tabs,
    required int index,
  })  : _tabs = tabs,
        section = index,
        super(key: key);

  final List _tabs;
  final section;

  @override
  Widget build(BuildContext context) {
    const ColorFilter greyscale = ColorFilter.matrix(<double>[
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0,
      0,
      0,
      1,
      0,
    ]);

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: _tabs[section]['tabs'].length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: MediaQuery.of(context).size.width *
            2 /
            (MediaQuery.of(context).size.height),
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: CustomColors.GridViewColor,
              elevation: 1,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
            ),
            onPressed: () {
              print(_tabs[section]['tabs'][index]);
              // Navigator.push(
              //   context,
              //   CupertinoPageRoute(
              //     builder: (context) => const ProductListingPage(),
              //   ),
              // );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(_tabs[section]['tabs'][index]['icon'],
                    fit: BoxFit.contain,
                    // colorBlendMode: BlendMode.softLight,
                    // color: CustomColors.GridImgColor,
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.12),
                Text(
                  _tabs[section]['tabs'][index]['title'],
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                      color: CustomColors.GridTitleColor,
                      fontSize: MediaQuery.of(context).size.width * 0.03),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
