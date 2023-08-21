import 'package:Bareeq/app/models/fit_out_model.dart';
import 'package:Bareeq/app/modules/searching/abstract_searching.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../dashboard/controllers/dashboard_controller.dart';

class FitOutsController extends GetxController with Searching{
  final searchingList = <FitOutModel>[].obs;
  final searchController = TextEditingController();
  final isSearching = false.obs;
  final focusNode = FocusNode();

  @override
  void addSearchedItemsForSearchedList({required String searchString}) {
    searchingList.value = Get.find<DashboardController>()
        .fitOuts
        .where((item) =>
    item.name!.toLowerCase().contains(searchString) ||
        item.property!.name!.toLowerCase().contains(searchString) ||
        item.unit!.name!.toLowerCase().contains(searchString))
        .toList();
  }

  @override
  void startSearch() {
    isSearching.value = true;
  }

  @override
  void stopSearch() {
    searchController.clear();
    searchingList.clear();
    isSearching.value = false;
  }

  @override
  onChangeSearching({required String searchString}) {
    if (searchController.text.isNotEmpty) {
      startSearch();
      addSearchedItemsForSearchedList(searchString: searchString);
    } else {
      stopSearch();
    }
  }


}