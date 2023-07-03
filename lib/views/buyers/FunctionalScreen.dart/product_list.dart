// import 'package:flutter/material.dart';
// import 'package:temp_store/Widgets/searchBar.dart';
// import 'package:temp_store/constants/colors.dart';

// class ProductListingScreen extends StatefulWidget {
//   final sampleText;

//   const ProductListingScreen({Key? key, required this.sampleText})
//       : super(key: key);

//   @override
//   State<ProductListingScreen> createState() => _ProductListingScreenState();
// }

// class _ProductListingScreenState extends State<ProductListingScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: CustomColors.appBarColor,
//         actions: [
//           Container(
//               width: MediaQuery.of(context).size.width,
//               color: Colors.transparent,
//               child: Padding(
//                 padding: const EdgeInsets.only(
//                   top: 5,
//                   left: 35,
//                   right: 35,
//                 ),
//                 child: Column(
//                   children: [
//                     HomeScreenSearchBar(),
//                   ],
//                 ),
//               ))
//         ],
//       ),
//       // body: ListView(
//       //   padding: EdgeInsets.only(
//       //       top: MediaQuery.of(context).size.height * 0.02, left: 25, right: 25),
//       //   children: [

//       //     // Material(child: HomeScreenSearchBar()),
//       //   ],
//       // ),
//     );
//   }
// }

import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';


class ProductListingPage extends StatefulWidget {
  @override
  _ProductListingPageState createState() => _ProductListingPageState();
}

class _ProductListingPageState extends State<ProductListingPage> {
  TextEditingController _searchController = TextEditingController();
  String _searchTerm = '';
  List<String> _selectedFilters = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Listing'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  _searchTerm = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search',
              ),
            ),
          ),
          _buildFilterOptions(),
          // Expanded(
          //   child: StreamBuilder<QuerySnapshot>(
          //     stream: _getProductsStream(),
          //     builder: (context, snapshot) {
          //       if (snapshot.hasError) {
          //         return Center(
          //           child: Text('Error: ${snapshot.error}'),
          //         );
          //       }

          //       if (snapshot.connectionState == ConnectionState.waiting) {
          //         return Center(
          //           child: CircularProgressIndicator(),
          //         );
          //       }

          //       List<DocumentSnapshot> products = snapshot.data!.docs;
          //       List<DocumentSnapshot> filteredProducts = _applyFilters(products);

          //       if (filteredProducts.isEmpty) {
          //         return Center(
          //           child: Text('No products found.'),
          //         );
          //       }

          //       return ListView.builder(
          //         itemCount: filteredProducts.length,
          //         itemBuilder: (context, index) {
          //           var productData = filteredProducts[index].data()!;
          //           return ListTile(
          //             leading: Image.network(
          //               productData['image_url'],
          //               width: 60,
          //               height: 60,
          //               fit: BoxFit.cover,
          //             ),
          //             title: Text(productData['title']),
          //             subtitle: Text('Price: \$${productData['price']}'),
          //             onTap: () {
          //               Navigator.push(
          //                 context,
          //                 MaterialPageRoute(
          //                   builder: (context) => ProductDetailPage(productData),
          //                 ),
          //               );
          //             },
          //           );
          //         },
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }

  // Stream<QuerySnapshot> _getProductsStream() {
  //   // Replace 'products' with the actual name of your collection in Firestore
  //   return FirebaseFirestore.instance.collection('products').snapshots();
  // }

  // List<DocumentSnapshot> _applyFilters(List<DocumentSnapshot> products) {
  //   return products.where((product) {
  //     var data = product.data()!;
  //     if (_searchTerm.isNotEmpty &&
  //         !data['title'].toLowerCase().contains(_searchTerm.toLowerCase())) {
  //       return false;
  //     }

  //     if (_selectedFilters.isNotEmpty) {
  //       return data['filter_attribute'].any((filter) {
  //         return _selectedFilters.contains(filter);
  //       });
  //     }

  //     return true;
  //   }).toList();
  // }

  // Widget _buildFilterOptions() {
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: Row(
  //       children: [
  //         Expanded(
  //           child: _buildFilterChip(
  //             label: 'Location',
  //             filters: ['Location A', 'Location B', 'Location C'],
  //           ),
  //         ),
  //         SizedBox(width: 8),
  //         Expanded(
  //           child: _buildFilterChip(
  //             label: 'Price',
  //             filters: ['Low', 'Medium', 'High'],
  //           ),
  //         ),
  //         SizedBox(width: 8),
  //         Expanded(
  //           child: _buildFilterChip(
  //             label: 'PTA',
  //             filters: ['PTA', 'Non PTA'],
  //           ),
  //         ),
  //         SizedBox(width: 8),
  //         Expanded(
  //           child: _buildFilterChip(
  //             label: 'JV',
  //             filters: ['JV', 'Non JV'],
  //           ),
  //         ),
  //         SizedBox(width: 8),
  //         Expanded(
  //           child: _buildFilterChip(
  //             label: 'Colors',
  //             filters: ['Red', 'Blue', 'Green'],
  //           ),
  //         ),
  //         SizedBox(width: 8),
  //         Expanded(
  //           child: _buildFilterChip(
  //             label: 'Brand',
  //             filters: ['Brand A', 'Brand B', 'Brand C'],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildFilterOptions() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        SizedBox(width: 8),
        _buildFilterChip(
          label: 'Location',
          filters: ['Location A', 'Location B', 'Location C'],
        ),
        SizedBox(width: 8),
        _buildFilterChip(
          label: 'Price',
          filters: ['Low', 'Medium', 'High'],
        ),
        SizedBox(width: 8),
        _buildFilterChip(
          label: 'PTA',
          filters: ['PTA', 'Non PTA'],
        ),
        SizedBox(width: 8),
        _buildFilterChip(
          label: 'JV',
          filters: ['JV', 'Non JV'],
        ),
        SizedBox(width: 8),
        _buildFilterChip(
          label: 'Colors',
          filters: ['Red', 'Blue', 'Green'],
        ),
        SizedBox(width: 8),
        _buildFilterChip(
          label: 'Brand',
          filters: ['Brand A', 'Brand B', 'Brand C'],
        ),
        SizedBox(width: 8),
      ],
    ),
  );
}

  

  Widget _buildFilterChip({required String label, required List<String> filters}) {
    return Wrap(
      spacing: 4,
      children: filters.map((filter) {
        return FilterChip(
          label: Text(filter),
          selected: _selectedFilters.contains(filter),
          onSelected: (isSelected) {
            setState(() {
              if (isSelected) {
                _selectedFilters.add(filter);
              } else {
                _selectedFilters.remove(filter);
              }
            });
          },
        );
      }).toList(),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final Map<String, dynamic> productData;

  ProductDetailPage(this.productData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              productData['image_url'],
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              productData['title'],
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text('Subtitle: ${productData['subtitle']}'),
            SizedBox(height: 8),
            Text('Price: \$${productData['price']}'),
            SizedBox(height: 8),
            Text('Model: ${productData['model']}'),
            SizedBox(height: 8),
            Text('Status: ${productData['status']}'),
          ],
        ),
      ),
    );
  }
}

