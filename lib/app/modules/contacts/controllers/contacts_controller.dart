import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../models/contact_model.dart';
import '../../profile/controllers/profile_controller.dart';
import '../../searching/abstract_searching.dart';

class ContactsController extends GetxController with Searching {
  final searchingList = <Contact>[].obs;
  final searchController = TextEditingController();
  final isSearching = false.obs;
  final focusNode = FocusNode();

  @override
  void addSearchedItemsForSearchedList({required String searchString}) {
    searchingList.value = Get.find<ProfileController>()
        .contacts
        .where((item) =>
            item.firstName!.toLowerCase().contains(searchString) ||
            item.lastName!.toLowerCase().contains(searchString) ||
            item.fullName!.toLowerCase().contains(searchString))
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
