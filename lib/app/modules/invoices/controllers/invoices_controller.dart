import 'package:bareeq/app/models/invoice.dart';
import 'package:bareeq/app/modules/searching/abstract_searching.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../services/check_internet_connection_service.dart';
import '../../dashboard/controllers/dashboard_controller.dart';

class InvoicesController extends GetxController with Searching {
  final searchingList = <Invoice>[].obs;
  final searchController = TextEditingController();
  final isSearching = false.obs;
  final focusNode = FocusNode();
  final connectionController = Get.find<InternetConnectionController>();


  @override
  void addSearchedItemsForSearchedList({required String searchString}) {
    searchingList.value = Get.find<DashboardController>()
        .invoices
        .where((item) =>
                item.name!.toLowerCase().contains(searchString) ||
                item.invoiceNumber!.toLowerCase().contains(searchString)
            )
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
