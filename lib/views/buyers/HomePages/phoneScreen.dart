import 'package:flutter/material.dart';
import 'package:temp_store/Widgets/youtubePlay.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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
        'Family Car',
        'Automatic Car',
        'Big Car',
        'Small Car',
        'Imported Car',
        'Old Car',
        'xyz Car',
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

  final YoutubePlayerController _ytController = YoutubePlayerController(
    initialVideoId: YoutubePlayer.convertUrlToId(
        'https://www.youtube.com/watch?v=zwEi3XIZTwc')!,
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.02, left: 25, right: 25),
      children: [
        // --- FIRST SECTION --- [Used Photos] text, tabs, gridview
        BrowseCarousel(tabs: _tabs),
        // --- Second SECTION --- [New Phones] x, y, z

        // --- ADVERTISEMENT ---
        Container(
          color: Colors.orange,
          height: 100,
        ),
        // --- Third SECTION --- [x] x, y, z
        Container(
          color: Colors.deepPurpleAccent,
          height: 200,
        ),
        // --- Fourth SECTION --- [x] x, y, z
        Container(
          color: Colors.blue,
          height: 200,
        ),
        // --- Fifth SECTION --- [Youtube]
        const YoutubeWidget(),
        // --- Sixth SECTION --- [PTA Tax]
        CurrentPTATaxWidget(devicePTAList: _devicePTAList),
        // --- ADVERTISEMENT ---
        Container(
          color: Colors.orange,
          height: 100,
        ),
      ],
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
                Text(
                  'Tech Reviews',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.width * 0.058,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
                  child: YoutubeVideo(
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
                  title: Text('Current PTA Tax',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.height * 0.026,
                          fontWeight: FontWeight.bold)),
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
                    width: 140,
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
                    title: Text(_devicePTAList[i][0]),
                    trailing: SizedBox(
                      width: 120,
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

class BrowseCarousel extends StatelessWidget {
  const BrowseCarousel({
    Key? key,
    required List<List<List>> tabs,
  })  : _tabs = tabs,
        super(key: key);

  final List<List<List>> _tabs;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      color: Colors.transparent,
      child: DefaultTabController(
          length: _tabs.length,
          child: Scaffold(
            appBar: AppBar(
              titleSpacing: 0,
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Browse Used Phones',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.width * 0.058,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // TAB Options
              bottom: TabBar(
                isScrollable: true,
                unselectedLabelColor: Colors.grey[600],
                labelColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue[900]),
                tabs: [
                  for (int i = 0; i < _tabs.length; i++)
                    Tab(
                      child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            _tabs[i][0][0],
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.038),
                          )),
                    ),
                ],
              ),
            ),
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
    );
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
                backgroundColor: Colors.grey[50],
                elevation: 2,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
              onPressed: () {},
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
