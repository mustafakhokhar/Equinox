import 'package:flutter/material.dart';

class HomeScreenSearchBar extends StatelessWidget {
  HomeScreenSearchBar({super.key});

  // This controller will store the value of the search bar
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search...',
          // Add a clear button to the search bar
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () => _searchController.clear(),
          ),
          // Add a search icon or button to the search bar
          prefixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Perform the search here
            },
          ),
          border: OutlineInputBorder(
            
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }
}
