import 'package:flutter/material.dart';

class HomeScreenSearchBar extends StatelessWidget {
  HomeScreenSearchBar({super.key});

  // This controller will store the value of the search bar
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const TextStyle dropdownMenuItem =
        TextStyle(color: Colors.black, fontSize: 18);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Material(
          elevation: 5.0,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
            child: TextField(
              controller: _searchController,
              cursorColor: Theme.of(context).primaryColor,
              style: dropdownMenuItem,
              decoration: InputDecoration(
                  hintText: "Search Phones",
                  hintStyle:
                      const TextStyle(color: Colors.black38, fontSize: 16),
                  prefixIcon: const Material(
                    elevation: 0.0,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: Icon(Icons.search),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () => _searchController.clear(),
                  ),
                  border: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
            ),
          ),
        ),
      ],
    );
  }
}
