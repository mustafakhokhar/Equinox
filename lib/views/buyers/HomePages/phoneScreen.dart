import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:temp_store/Widgets/headingText.dart';
import 'package:temp_store/constants/colors.dart';
import 'package:temp_store/constants/iconPath.dart';
import 'package:temp_store/constants/imagePath.dart';
import 'package:temp_store/views/buyers/FunctionalScreen.dart/ProductListing/product_list.dart';

class PhoneScreen extends StatelessWidget {
  const PhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // PhoneListingController controller = Get.put(PhoneListingController());
    final List Phones = [
      {
        'section': 'Category',
        'tabs': [
          {
            'title': 'PTA',
            'icon': icPtaphone,
            'filterKey': 'pta',
            'filterValue': true,
          },
          {'title': 'JV', 'icon': imSimCard, 'onPress': () {}},
          {
            'title': 'NON PTA',
            'icon': icNonPta,
            'filterKey': 'pta',
            'filterValue': false,
          },
          {'title': 'Open Box', 'icon': icOpenBox, 'onPress': () {}},
          {'title': 'ios', 'icon': icIos, 'onPress': () {}},
          {'title': 'Kit', 'icon': icKitPhone, 'onPress': () {}},
          {'title': 'Android', 'icon': icAndroid, 'onPress': () {}},
          {'title': 'With box', 'icon': icNewPhone, 'onPress': () {}},
        ],
      },
      {
        'section': 'Budget',
        'tabs': [
          {'title': 'Phone under 30k', 'icon': null, 'onPress': () {}},
          {'title': 'Phone under 50k', 'icon': null, 'onPress': () {}},
          {'title': 'Phone under 70k', 'icon': null, 'onPress': () {}},
          {'title': 'Phone under 100k', 'icon': null, 'onPress': () {}},
          {'title': 'Phone under 150k', 'icon': null, 'onPress': () {}},
          {'title': 'Phone under 200k', 'icon': null, 'onPress': () {}},
          {'title': 'Phone under 300k', 'icon': null, 'onPress': () {}},
          {'title': 'Phone under 500k', 'icon': null, 'onPress': () {}},
        ],
      },
      {
        'section': 'Brand',
        'tabs': [
          {'title': 'Apple', 'icon': icAppleLogo, 'onPress': () {}},
          {'title': 'Samsung', 'icon': icSamsungLogo, 'onPress': () {}},
          {'title': 'Huawei', 'icon': icHuaweiLogo, 'onPress': () {}},
          {'title': 'Oppo', 'icon': icOppoLogo, 'onPress': () {}},
          {'title': 'Vivo', 'icon': icVivoLogo, 'onPress': () {}},
          {'title': 'Xiaomi', 'icon': icXiaomiLogo, 'onPress': () {}},
        ],
      },
    ];
    final List devicePTAList = [
      ['iPhone 14 Pro Max', '152k', '187k'],
      ['iPhone 14 Pro', '132k', '147k'],
      ['iPhone 14 Max', '132k', '123k'],
      ['iPhone 14', '122k', '137k'],
      ['iPhone 13 Pro Max', '151k', '124k'],
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
                length: Phones.length,
                child: Scaffold(
                  appBar: AppBar(
                    titleSpacing: 0,
                    elevation: 0,
                    backgroundColor: CustomColors.appBackgroundColor,
                    title: HeadingText(
                      text: 'Browse Phones',
                      linkString: 'All Phones',
                      link: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const ProductListingPage(filterKey: null, filterValue: null,),
                          ),
                        );
                      },
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
                        Phones.length,
                        (index) => Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              Phones[index]['section'],
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
                          tabs: Phones,
                          index: 0,
                          crossAxisCount: 2,
                          childAspectRatio: MediaQuery.of(context).size.width *
                              2.8 /
                              (MediaQuery.of(context).size.height),
                        ),
                        MainGridText(
                          tabs: Phones,
                          index: 1,
                        ),
                        MainGrid(
                          tabs: Phones,
                          index: 2,
                          crossAxisCount: 2,
                          childAspectRatio: MediaQuery.of(context).size.width *
                              2.8 /
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
                    child: HeadingText(text: 'Featured Phones'),
                  ),
                  Expanded(
                    child: FeaturedProductCarousel(tabs: Phones),
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
                    child: HeadingText(text: 'Phones Listing'),
                  ),
                  Expanded(
                    child: NormalProductCarousel(tabs: Phones),
                  ),
                ],
              ),
            );
          case 5:
            return const YoutubeWidget();
          case 6:
            return CurrentPTATaxWidget(devicePTAList: devicePTAList);
          case 7:
            return const AdsPlaceHolder();
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}

class NormalProductCarousel extends StatelessWidget {
  const NormalProductCarousel({
    Key? key,
    required List tabs,
  })  : _tabs = tabs,
        super(key: key);

  final List _tabs;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        crossAxisCount: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: MediaQuery.of(context).size.width *
            3 /
            (MediaQuery.of(context).size.height),
        children: List.generate(
          _tabs.length,
          (index) => GestureDetector(
              child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 2,
                  child: Column(
                    children: [
                      Image.network(
                        'http://via.placeholder.com/640x360',
                        fit: BoxFit.contain,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              _tabs[0]['tabs'][index]['title'],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.045,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: Text(
                            _tabs[0]['tabs'][index]['title'],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: Text(
                            _tabs[0]['tabs'][index]['title'],
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.035,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                              child: Text(
                                'NEW',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.035,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                              child: Text(
                                'PTA',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.035,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                              child: Text(
                                '256GB',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.035,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
              onTap: () {
                print('object');
              }),
        ));
  }
}

class FeaturedProductCarousel extends StatelessWidget {
  const FeaturedProductCarousel({
    Key? key,
    required List tabs,
  })  : _tabs = tabs,
        super(key: key);

  final List _tabs;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        crossAxisCount: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: MediaQuery.of(context).size.width *
            3 /
            (MediaQuery.of(context).size.height),
        children: List.generate(
          _tabs.length,
          (index) => Stack(children: [
            GestureDetector(
              child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 2,
                  child: Column(
                    children: [
                      Image.asset(
                        _tabs[0]['tabs'][index]['icon'],
                        alignment: Alignment.center,
                        fit: BoxFit.contain,
                        height: MediaQuery.of(context).size.height * 0.17,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              _tabs[0]['tabs'][index]['title'],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.045,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: Text(
                            _tabs[0]['tabs'][index]['title'],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: Text(
                            _tabs[0]['tabs'][index]['title'],
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.035,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                              child: Text(
                                'NEW',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.035,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                              child: Text(
                                'PTA',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.035,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                              child: Text(
                                '256GB',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.035,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
              onTap: () {
                print('tapped');
              },
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(Icons.star, color: Color.fromARGB(255, 247, 185, 29)),
            )
          ]),
        ));
  }
}

class AdsPlaceHolder extends StatelessWidget {
  const AdsPlaceHolder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        color: CustomColors.appBarColor,
        height: 100,
        child: const Align(
            alignment: Alignment.center,
            child: Text(
              'Advertisement',
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
      ),
    );
  }
}

class YoutubeWidget extends StatelessWidget {
  const YoutubeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      color: Colors.transparent,
      height: MediaQuery.of(context).size.height * 0.35,
      child: const Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: HeadingText(text: 'Tech Reviews'),
          ),
          // Container(
          //   padding: const EdgeInsets.only(top: 10, bottom: 10),
          //   child: Column(
          //     children: [
          //       Container(
          //         decoration: BoxDecoration(
          //           color: Colors.white,
          //           borderRadius: BorderRadius.circular(20),
          //         ),
          //         child: const YoutubeVideo(
          //             "https://www.youtube.com/watch?v=zwEi3XIZTwc"),
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}

class CurrentPTATaxWidget extends StatelessWidget {
  const CurrentPTATaxWidget({
    Key? key,
    required List devicePTAList,
  })  : _devicePTAList = devicePTAList,
        super(key: key);

  final List _devicePTAList;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black45),
            borderRadius: BorderRadius.circular(10)),
        height: MediaQuery.of(context).size.height * 0.46,
        child: ListView(
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                child: ListTile(
                  horizontalTitleGap: 1,
                  leading: Icon(Icons.paid_outlined,
                      color: Colors.black,
                      size: MediaQuery.of(context).size.height * 0.035),
                  contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  title: const HeadingText(text: 'Current PTA Tax'),
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Card(
                semanticContainer: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: const Color.fromARGB(221, 29, 28, 28),
                elevation: 2,
                child: ListTile(
                  title: const Text('Device',
                      style: TextStyle(color: Colors.white)),
                  trailing: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Passport', style: TextStyle(color: Colors.white)),
                        Text('CNIC', style: TextStyle(color: Colors.white))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            for (int i = 0; i < _devicePTAList.length; i++)
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Card(
                  shadowColor: Colors.grey[50],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 1,
                  child: ListTile(
                    title: Text(
                      _devicePTAList[i][0],
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.039),
                    ),
                    trailing: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(_devicePTAList[i][1]),
                          Text(_devicePTAList[i][2])
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ));
  }
}

class MainGridText extends StatelessWidget {
  const MainGridText({
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
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
      child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: MediaQuery.of(context).size.width * 0.05,
          childAspectRatio: MediaQuery.of(context).size.width *
              6.5 /
              (MediaQuery.of(context).size.height),
          children: List.generate(
              _tabs[section]['tabs'].length,
              (index) => GestureDetector(
                    onTap: () {},
                    child: Text(
                      _tabs[section]['tabs'][index]['title'],
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.02),
                    ),
                  ))),
    );
  }
}

class MainGrid extends StatelessWidget {
  const MainGrid({
    Key? key,
    required List tabs,
    required int index,
    required int crossAxisCount,
    required double childAspectRatio,
  })  : _tabs = tabs,
        section = index,
        crossAxisCount = crossAxisCount,
        childAspectRatio = childAspectRatio,
        super(key: key);

  final List _tabs;
  final section;
  final int crossAxisCount;
  final double childAspectRatio;

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
      scrollDirection: Axis.horizontal,
      itemCount: _tabs[section]['tabs'].length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: childAspectRatio,
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
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => ProductListingPage(
                    filterKey: _tabs[section]['tabs'][index]['filterKey'],
                    filterValue: _tabs[section]['tabs'][index]['filterValue'],
                  ),
                ),
              );
              // _tabs[section]['tabs'][index]['filterKey'];
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ColorFiltered(
                  colorFilter: greyscale,
                  child: Image.asset(_tabs[section]['tabs'][index]['icon'],
                      fit: BoxFit.contain,
                      // colorBlendMode: BlendMode.softLight,
                      // color: CustomColors.GridImgColor,
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.09),
                ),
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    _tabs[section]['tabs'][index]['title'],
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(
                        color: CustomColors.GridTitleColor,
                        fontSize: MediaQuery.of(context).size.width * 0.03),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
