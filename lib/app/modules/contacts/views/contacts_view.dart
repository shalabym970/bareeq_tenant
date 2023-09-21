import 'package:bareeq/app/modules/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_details_app_bar.dart';
import '../../../../common/widgets/custom_text_field.dart';
import '../../../../common/widgets/empty_list_widget.dart';
import '../../../../common/widgets/no_internet_connection_widget.dart';
import '../../../models/contact_model.dart';
import '../../profile/widgets/contacts/contacts_list_item.dart';
import '../controllers/contacts_controller.dart';
import '../widgets/contacts_list/contacts_list_widget.dart';

class ContactsView extends GetView<ContactsController> {
  const ContactsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.connectionController.isConnected.isTrue
        ? RefreshIndicator(
            color: ColorManager.mainColor,
            onRefresh: () async {
              Get.find<ProfileController>().getContacts();
            },
            child: GestureDetector(
                onTap: () {
                  controller.focusNode.unfocus();
                },
                child: Scaffold(
                    appBar: customDetailsAppBar(title: Strings.contacts),
                    body: Padding(
                        padding:
                            EdgeInsets.only(right: 10.w, left: 10.w, top: 20.h),
                        child: SingleChildScrollView(
                            primary: false,
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: Obx(() => Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomTextField(
                                          hint: Strings.search,
                                          controller:
                                              controller.searchController,
                                          height: 50.h,
                                          width: 1.sw,
                                          focusNode: controller.focusNode,
                                          onChanged: (value) {
                                            controller.onChangeSearching(
                                                searchString: value);
                                          },
                                          suffixIcon: controller
                                                  .isSearching.isTrue
                                              ? GestureDetector(
                                                  onTap: () {
                                                    controller.stopSearch();
                                                  },
                                                  child: Icon(Icons.clear,
                                                      color: ColorManager.black,
                                                      size: 25.sp))
                                              : null),
                                      SizedBox(height: 10.h),
                                      controller.isSearching.isTrue
                                          ? controller.searchingList.isEmpty
                                              ? Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 0.3.sh),
                                                  child: const EmptyListWidget(
                                                      message: Strings
                                                          .noSearchResult))
                                              : ListView.builder(
                                                  padding: EdgeInsets.only(
                                                      bottom: 10.h, top: 10.h),
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  itemCount: controller
                                                      .searchingList.length,
                                                  itemBuilder: ((_, index) {
                                                    Contact contact = controller
                                                        .searchingList
                                                        .elementAt(index);
                                                    return ContactsListItem(
                                                        contact: contact);
                                                  }))
                                          : const ContactsListWidget()
                                    ])))))))
        : const NoInternetConnectionView());
  }
}
