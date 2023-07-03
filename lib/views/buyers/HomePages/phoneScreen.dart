import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:temp_store/Widgets/headingText.dart';
import 'package:temp_store/Widgets/youtubePlay.dart';
import 'package:temp_store/constants/colors.dart';
import 'package:temp_store/views/buyers/FunctionalScreen.dart/product_list.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({super.key});

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  final List<List<List>> _tabs = [
    [
      // Name to tab
      ['Category'],
      // Text for each button in the tab
      [
        'NON PTA',
        'PTA',
        'JV',
        'Open Box',
        'Kit',
        'With box',
        'Damaged',
        'Abc Car',
        'Ghasti Car'
      ],
      // icons for each button in the tab
      [
        Icon(
          Icons.car_rental,
          color: Colors.grey[600],
        ),
        Icon(
          Icons.car_crash,
          color: Colors.grey[600],
        ),
        Icon(
          Icons.car_repair,
          color: Colors.grey[600],
        ),
        Icon(
          Icons.car_rental,
          color: Colors.grey[600],
        ),
        Icon(
          Icons.car_crash,
          color: Colors.grey[600],
        ),
        Icon(
          Icons.car_repair,
          color: Colors.grey[600],
        ),
        Icon(
          Icons.car_rental,
          color: Colors.grey[600],
        ),
        Icon(
          Icons.car_crash,
          color: Colors.grey[600],
        ),
        Icon(
          Icons.car_repair,
          color: Colors.grey[600],
        ),
      ],
      //On press command for subsequent Tab
    ],
    [
      ['Budget'],
      [
        'Phone under 30k',
        'Phone under 50k',
        'Phone under 70k',
        'Phone under 100k',
        'Phone under 150k',
        'Phone under 200k',
        'Phone under 300k',
        'Phone under 500k'
      ],
    ],
    [
      ['Brand'],
      [
        'Apple',
        'Samsung',
        'Nothing',
        'Oppo',
        'Vivo',
        'Huawei',
        'Motorola',
        'Infinix',
        'Xiaomi',
      ],
      // icons for each button in the tab
      [
        Icon(
          Icons.car_rental,
          color: Colors.grey[600],
        ),
        Icon(
          Icons.car_crash,
          color: Colors.grey[600],
        ),
        Icon(
          Icons.car_repair,
          color: Colors.grey[600],
        ),
        Icon(
          Icons.car_rental,
          color: Colors.grey[600],
        ),
        Icon(
          Icons.car_crash,
          color: Colors.grey[600],
        ),
        Icon(
          Icons.car_repair,
          color: Colors.grey[600],
        ),
        Icon(
          Icons.car_rental,
          color: Colors.grey[600],
        ),
        Icon(
          Icons.car_crash,
          color: Colors.grey[600],
        ),
        Icon(
          Icons.car_repair,
          color: Colors.grey[600],
        ),
      ],
    ],
    [
      ['Color'],
    ],
    [
      ['type'],
    ],
    [
      ['Hello'],
    ]
  ];
  final List _devicePTAList = [
    ['iPhone 14 Pro Max', '152k', '187k'],
    ['iPhone 14 Pro', '132k', '147k'],
    ['iPhone 14 Max', '132k', '123k'],
    ['iPhone 14', '122k', '137k'],
    ['iPhone 13 Pro Max', '151k', '124k'],
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.02, left: 25, right: 25),
      children: [
        // --- FIRST SECTION --- [Used Phones]
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          color: Colors.transparent,
          child: DefaultTabController(
              length: _tabs.length,
              child: Scaffold(
                appBar: AppBar(
                  titleSpacing: 0,
                  elevation: 0,
                  backgroundColor: CustomColors.appBackgroundColor,
                  title: const HeadingText(text: 'Browse Used Phones'),
                  // TAB Options
                  bottom: TabBar(
                    isScrollable: true,
                    unselectedLabelColor: CustomColors.tabUnSelectedLabelColor,
                    labelColor: CustomColors.tabLabelColor,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: CustomColors.buttonUnselectedColor),
                    tabs: [
                      for (int i = 0; i < _tabs.length; i++)
                        Tab(
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                _tabs[i][0][0],
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.038),
                              )),
                        ),
                    ],
                  ),
                ),
                backgroundColor: CustomColors.appBackgroundColor,
                // Grid View of the tabs
                body: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 10, 0, 10),
                  child: TabBarView(children: [
                    MainGrid(
                      tabs: _tabs,
                      index: 0,
                    ),
                    MainGridText(
                      tabs: _tabs,
                      index: 1,
                    ),
                    MainGrid(
                      tabs: _tabs,
                      index: 2,
                    ),
                    const Icon(Icons.food_bank),
                    const Icon(Icons.woman),
                    const Icon(Icons.woman),
                  ]),
                ),
              )),
        ),
        // --- Second SECTION --- [Our Offerings]
        Container(
          padding: const EdgeInsets.only(top: 20, bottom: 10),
          height: MediaQuery.of(context).size.height * 0.34,
          child: Column(
            children: [
              const HeadingText(text: 'Equinox\'s Offerings'),
              Card(
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
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Hassel Free',
                            style: TextStyle(
                              color: Colors.blue[600],
                            ),
                          ),
                          Text(
                            'Secure',
                            style: TextStyle(
                              color: Colors.blue[600],
                            ),
                          ),
                          Text(
                            'Best Price',
                            style: TextStyle(
                              color: Colors.blue[600],
                            ),
                          ),
                        ],
                      ),
                    ],
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
                        trailing: Icon(Icons.arrow_forward_ios),
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
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // --- ADVERTISEMENT ---
        const AdsPlaceHolder(),
        // --- Third SECTION --- [Featured Phones]
        Container(
          color: Color.fromARGB(0, 0, 0, 0),
          height: MediaQuery.of(context).size.height * 0.37,
          child: Column(
            children: [
              const HeadingText(text: 'Featured Phones'),
              Expanded(
                child: FeaturedProductCarousel(tabs: _tabs),
              ),
            ],
          ),
        ),
        // --- Fourth SECTION --- [Phones Listing]
        Container(
          color: Colors.transparent,
          height: MediaQuery.of(context).size.height * 0.37,
          child: Column(
            children: [
              const HeadingText(text: 'Phones Listing'),
              Expanded(
                child: NormalProductCarousel(tabs: _tabs),
              ),
            ],
          ),
        ),
        // --- Fifth SECTION --- [Youtube]
        const YoutubeWidget(),
        // --- Sixth SECTION --- [PTA Tax]
        CurrentPTATaxWidget(devicePTAList: _devicePTAList),
        // --- ADVERTISEMENT ---
        const AdsPlaceHolder(),
      ],
    );
  }
}

class NormalProductCarousel extends StatelessWidget {
  const NormalProductCarousel({
    Key? key,
    required List<List<List>> tabs,
  })  : _tabs = tabs,
        super(key: key);

  final List<List<List>> _tabs;

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
      children: [
        for (int i = 0; i < _tabs[0][1].length; i++)
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
                              _tabs[0][1][i],
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
                            _tabs[0][1][i],
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
                            _tabs[0][1][i],
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
      ],
    );
  }
}

class FeaturedProductCarousel extends StatelessWidget {
  const FeaturedProductCarousel({
    Key? key,
    required List<List<List>> tabs,
  })  : _tabs = tabs,
        super(key: key);

  final List<List<List>> _tabs;

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
      children: [
        for (int i = 0; i < _tabs[0][1].length; i++)
          Stack(children: [
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
                              _tabs[0][1][i],
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
                            _tabs[0][1][i],
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
                            _tabs[0][1][i],
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
      ],
    );
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
        color: Colors.indigo[300],
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
      height: MediaQuery.of(context).size.height * 0.34,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const HeadingText(text: 'Tech Reviews'),
                Text(
                  'see all',
                  style: TextStyle(
                    color: Colors.blue[900],
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const YoutubeVideo(
                      "https://www.youtube.com/watch?v=zwEi3XIZTwc"),
                ),
              ],
            ),
          )
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
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
    required List<List<List>> tabs,
    required int index,
  })  : _tabs = tabs,
        count = index,
        super(key: key);

  final List<List<List>> _tabs;
  final count;

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
        children: [
          for (int i = 0; i < _tabs[count][1].length; i++)
            GestureDetector(
              onTap: () {},
              child: Text(
                _tabs[count][1][i],
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.02),
              ),
            )
        ],
      ),
    );
  }
}

class MainGrid extends StatelessWidget {
  const MainGrid({
    Key? key,
    required List<List<List>> tabs,
    required int index,
  })  : _tabs = tabs,
        count = index,
        super(key: key);

  final List<List<List>> _tabs;
  final count;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: MediaQuery.of(context).size.width *
          2.8 /
          (MediaQuery.of(context).size.height),
      children: [
        for (int i = 0; i < _tabs[count][1].length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(1, 5, 1, 2),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: CustomColors.GridViewColor,
                elevation: 2,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => ProductListingPage(),
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  _tabs[count][2][i], // icon
                  Text(
                    _tabs[count][1][i],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.03,
                        color: Colors.black87),
                  ), // text
                ],
              ),
            ),
          )
      ],
    );
  }
}
