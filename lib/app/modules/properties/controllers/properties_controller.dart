import 'package:bareeq/app/models/leased_property.dart';
import 'package:bareeq/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/strings/error_strings.dart';
import '../../../../common/widgets/ui.dart';
import '../../../models/contact_model.dart';
import '../../../models/sold_property.dart';
import '../../../repositories/lease_repo.dart';
import '../../../services/session_services.dart';
import '../../searching/abstract_searching.dart';

class PropertiesController extends GetxController with Searching {
  final searchingList = <LeasedProperty>[].obs;
  final searchController = TextEditingController();
  final isSearching = false.obs;
  final focusNode = FocusNode();
  final selectLeasedProperties = true.obs;
  final error = false.obs;
  final loading = false.obs;
  final leasedProperties = <LeasedProperty>[].obs;
  final soldProperties = <SoldProperty>[].obs;
  final propertiesRepo = PropertiesRepo();

  @override
  void onInit() {
    getLeasedProperties();
    getSoldProperties();
    super.onInit();
  }

  Contact get currentUser {
    return Get.find<SessionServices>().currentUser.value;
  }

  void getLeasedProperties() async {
    try {
      error.value = false;
      loading.value = true;
      leasedProperties.assignAll(await propertiesRepo.getLeasedProperties());
    } catch (e) {
      error.value = true;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
      Get.log('========== Error when get Leased Properties : $e ==========');
    } finally {
      loading.value = false;
    }
  }

  void getSoldProperties() async {
    try {
      error.value = false;
      loading.value = true;
      soldProperties.assignAll(await propertiesRepo.getSoldProperties());
    } catch (e) {
      error.value = true;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
      Get.log('========== Error when get sold Properties : $e ==========');
    } finally {
      loading.value = false;
    }
  }

  @override
  void addSearchedItemsForSearchedList({required String searchString}) {
    searchingList.value = Get.find<DashboardController>()
        .leases
        .where((item) =>
            item.name!.toLowerCase().contains(searchString) ||
            item.property!.name!.toLowerCase().contains(searchString))
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
