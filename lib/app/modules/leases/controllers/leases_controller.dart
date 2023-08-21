import 'package:Bareeq/app/models/lease_model.dart';
import 'package:Bareeq/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../searching/abstract_searching.dart';

class LeasesController extends GetxController with Searching {
  final searchingList = <LeaseModel>[].obs;
  final searchController = TextEditingController();
  final isSearching = false.obs;
  final focusNode = FocusNode();

  @override
  void addSearchedItemsForSearchedList({required String searchString}) {
    searchingList.value = Get.find<DashboardController>()
        .leases
        .where((item) =>
            item.name!.toLowerCase().contains(searchString) ||
            item.property!.name!.toLowerCase().contains(searchString) ||
            item.crmLeaseNumber!.toLowerCase().contains(searchString) ||
            item.erpLeaseNumber!.toString().contains(searchString))
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
