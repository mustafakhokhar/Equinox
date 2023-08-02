import 'package:get/get.dart';
import 'package:temp_store/models/phoneModel.dart';
import 'package:temp_store/models/sortModel.dart';
import 'package:temp_store/services/database.dart';

class PhoneListingController extends GetxController {
  final Rx<List<PhoneModel>> _phoneList = Rx<List<PhoneModel>>([]);
  List<PhoneModel> get phonesAds => _phoneList.value;

  final _allLocations = <String, dynamic>{}.obs;
  Map<String, dynamic> get allLocations => _allLocations;

  final _selectedFilters = <String, dynamic>{}.obs;
  Map<String, dynamic> get selectedFilters => _selectedFilters;

  final _sortModel = SortModel(
          displayName: 'Newest First',
          sortField: 'createdAt',
          sortValueDescend: true)
      .obs;
  SortModel get sortModel => _sortModel.value;

  @override
  void onInit() {
    super.onInit();
    fetchPhones();
  }

  void fetchPhones() {
    _phoneList.bindStream(
        Database().getAllPhoneAdsFiltered(_selectedFilters, _sortModel.value));
  }

  void removeFilter(filterKey) {
    if (_selectedFilters.containsKey(filterKey)) {
      _selectedFilters.remove(filterKey);
      print('check 1 - Remove filter list Not empty');
      fetchPhones();
    }
  }

  void applyFilter(filterKey, dynamic value) {
    _selectedFilters[filterKey] = value;
    if (_selectedFilters.isNotEmpty) {
      print('check 2 - Apply filter list Not empty');
      fetchPhones();
    }
  }

  void clearAllFilters() {
    if (_selectedFilters.isNotEmpty) {
      _selectedFilters.clear();
      Get.back();
      print('check 3 - Remove filter list Not empty');
      fetchPhones();
    }
  }

  void applySort(SortModel sortModel) {
    _sortModel.value = sortModel;
    fetchPhones();
    Get.back();
  }
}
