import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:temp_store/Widgets/searchBar.dart';
import 'package:temp_store/views/buyers/FunctionalScreen.dart/productDetails.dart';

import '../../../constants/colors.dart';

class ProductListingPage extends StatelessWidget {
  const ProductListingPage({super.key});

  @override
  Widget build(BuildContext context) {
    const TextStyle dropdownMenuItem =
        TextStyle(color: Colors.black, fontSize: 18);

    final List<Map> filteredProducts = [
      {
        'title': 'iPhone 12 Pro Max',
        'price': '800',
        'image_url': 'http://via.placeholder.com/640x360',
        'condition': 'New',
        'approved': 'PTA',
        'storage': '64GB',
        'location': 'Islamabad'
      },
      {
        'title': 'Samsung Galaxy S21 Ultra',
        'price': '200',
        'image_url': 'http://via.placeholder.com/640x360',
        'condition': 'New',
        'approved': 'PTA',
        'storage': '64GB',
        'location': 'Karachi'
      },
      {
        'title': 'Nothing Phone 1',
        'price': '300',
        'image_url': 'http://via.placeholder.com/640x360',
        'condition': 'New',
        'approved': 'Non-PTA',
        'storage': '64GB',
        'location': 'Lahore'
      },
      {
        'title': 'iPhone 13',
        'price': '400',
        'image_url': 'http://via.placeholder.com/640x360',
        'condition': 'New',
        'approved': 'PTA',
        'storage': '64GB',
        'location': 'Quetta'
      },
      {
        'title': 'Saumsung Galaxy A51s',
        'price': '400',
        'image_url': 'http://via.placeholder.com/640x360',
        'condition': 'New',
        'approved': 'Non-PTA',
        'storage': '64GB',
        'location': 'United Kingdom'
      },
      {
        'title': 'Nokia 3310',
        'price': '400',
        'image_url': 'http://via.placeholder.com/640x360',
        'condition': 'New',
        'approved': 'PTA',
        'storage': '64GB',
        'location': 'Pishin'
      },
      {
        'title': 'Samsung Galaxy Z-Flip 5',
        'price': '400',
        'image_url': 'http://via.placeholder.com/640x360',
        'condition': 'New',
        'approved': 'PTA',
        'storage': '64GB',
        'location': 'Mustoong'
      },
      {
        'title': 'iPhone SE 2020',
        'price': '400',
        'image_url': 'http://via.placeholder.com/640x360',
        'condition': 'New',
        'approved': 'PTA',
        'storage': '64GB',
        'location': 'Islamabad'
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xfff0f0f0),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              // purple backdrop design and App bar
              Container(
                height: MediaQuery.of(context).size.height * 0.165,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        "Phones",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.filter_list,
                          color: primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Search bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.128,
                    ),
                    HomeScreenSearchBar(),
                  ],
                ),
              ),
              // Each Item Card
              SafeArea(
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.15),
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  child: ListView.builder(
                      itemCount: filteredProducts.length,
                      itemBuilder: (BuildContext context, int index) {
                        // List of items
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => ProductDetailsPage(),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                            ),
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.15,
                            margin: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 20),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // Image
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.32,
                                  margin: const EdgeInsets.only(right: 15),
                                  decoration: BoxDecoration(
                                    // color: Colors.amber,
                                    // borderRadius: BorderRadius.circular(50),
                                    border:
                                        Border.all(width: 2, color: secondary),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            filteredProducts[index]['image_url']
                                            // filterProducts[index]['image_url']
                                            ),
                                        fit: BoxFit.contain),
                                  ),
                                ),
                                // Text to Display
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      customText(
                                        filteredProducts[index]['title'],
                                        18,
                                        FontWeight.bold,
                                      ),
                                      customText(
                                        'PKR ${filteredProducts[index]['price']}',
                                        16,
                                        FontWeight.bold,
                                      ),
                                      customText(
                                        filteredProducts[index]['location'],
                                        15,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          customText(
                                            filteredProducts[index]['approved'],
                                            13,
                                          ),
                                          const Icon(
                                            Icons.more_vert,
                                            color: secondary,
                                            size: 12,
                                          ),
                                          customText(
                                            filteredProducts[index]['condition'],
                                            13,
                                          ),
                                          const Icon(
                                            Icons.more_vert,
                                            color: secondary,
                                            size: 12,
                                          ),
                                          customText(
                                            filteredProducts[index]['storage'],
                                            13,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget customText(String text, double? fsize, [fweight = FontWeight.normal]) {
  return Text(text,
      style: TextStyle(
          color: primary,
          fontSize: fsize,
          fontWeight: fweight,
          letterSpacing: .3));
}
