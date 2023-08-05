import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controllers/UIcontrollers/bottomSheetDataController.dart';

// Fetch Locations from CSV and convert to List<String>
Future<List<String>> loadLocations() async {
  List<String> locations = [];
  try {
    final rawData = await rootBundle.loadString("assets/City.csv");
    List<List<dynamic>> listData = const CsvToListConverter().convert(rawData);
    for (final d in listData) {
      locations.add(d[0].toString());
    }
    Get.find<BottomSheetsDataController>().listData['location'] = locations;
  } catch (e) {
    // Handle any potential errors, e.g., file not found or parsing error.
    print("Error loading CSV: $e");
  }
  return locations;
}

// Fetch Locations from CSV and convert to List<String>
Future<List<String>> loadMakers() async {
  List<String> makers = [];
  try {
    final rawData = await rootBundle.loadString("assets/Makers.csv");
    List<List<dynamic>> listData = const CsvToListConverter().convert(rawData);
    for (final d in listData) {
      makers.add(d[0].toString());
    }
    Get.find<BottomSheetsDataController>().listData['make'] = makers;
  } catch (e) {
    // Handle any potential errors, e.g., file not found or parsing error.
    print("Error loading CSV: $e");
  }
  return makers;
}
