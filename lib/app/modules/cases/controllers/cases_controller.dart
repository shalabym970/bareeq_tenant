import 'package:Seef/app/modules/searching/abstract_searching.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../models/case_model.dart';
import '../../dashboard/controllers/dashboard_controller.dart';

class CasesController extends GetxController with Searching {
  final searchingList = <Case>[].obs;
  final searchController = TextEditingController();
  final isSearching = false.obs;
  final focusNode = FocusNode();

  @override
  void addSearchedItemsForSearchedList({required String searchString}) {
    searchingList.value = Get.find<DashboardController>()
        .cases
        .where((item) =>
            item.caseNumber!.toLowerCase().contains(searchString) ||
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
