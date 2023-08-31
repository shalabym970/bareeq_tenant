import 'package:Bareeq/app/models/work_permit.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../dashboard/controllers/dashboard_controller.dart';
import '../../searching/abstract_searching.dart';

class WorkPermitsController extends GetxController with Searching{
  final searchingList = <WorkPermit>[].obs;
  final searchController = TextEditingController();
  final isSearching = false.obs;
  final focusNode = FocusNode();

  @override
  void addSearchedItemsForSearchedList({required String searchString}) {
    searchingList.value = Get.find<DashboardController>()
        .workPermits
        .where((item) =>
    item.subject!.toLowerCase().contains(searchString) ||
        item.relatedUnit!.name!.toLowerCase().contains(searchString) ||
        item.description!.toLowerCase().contains(searchString))
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
