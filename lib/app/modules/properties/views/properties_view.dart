import 'package:bareeq/app/models/sold_property.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_appbar.dart';
import '../../../../common/widgets/custom_drawer.dart';
import '../../../../common/widgets/custom_text_field.dart';
import '../../../../common/widgets/empty_list_widget.dart';
import '../../../models/leased_property.dart';
import '../../../routes/app_routes.dart';
import '../../dashboard/widgets/recent_properties/leases_list_item.dart';
import '../controllers/properties_controller.dart';
import '../widgets/properties_list/properties_list_widget.dart';
import '../widgets/properties_list/sold_property_item.dart';
import '../widgets/properties_switcher_btn.dart';

class PropertiesView extends GetView<PropertiesController> {
  const PropertiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Get.offAllNamed(Routes.dashboard);
          return true;
        },
        child: RefreshIndicator(
            color: ColorManager.mainColor,
            onRefresh: () async {
              controller.selectLeasedProperties.isTrue
                  ? controller.getLeasedProperties()
                  : controller.getSoldProperties();
            },
            child: GestureDetector(
                onTap: () {
                  controller.focusNode.unfocus();
                },
                child: Scaffold(
                    appBar: customAppBar(title: Strings.properties),
                    body: SingleChildScrollView(
                        primary: false,
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: Obx(() => Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const PropertiesSwitcherBTN(),
                                  SizedBox(height: 20.h),
                                  CustomTextField(
                                    hint: Strings.search,
                                    controller: controller.searchController,
                                    height: 50.h,
                                    width: 10.sw,
                                    focusNode: controller.focusNode,
                                    onChanged: (value) {
                                      controller.onChangeSearching(
                                          searchString: value);
                                    },
                                    suffixIcon: controller.isSearching.isTrue
                                        ? GestureDetector(
                                            onTap: () {
                                              controller.stopSearch();
                                            },
                                            child: Icon(Icons.clear,
                                                color: ColorManager.black,
                                                size: 25.sp),
                                          )
                                        : null,
                                  ),
                                  SizedBox(height: 10.h),
                                  controller.isSearching.isTrue
                                      ? controller.selectLeasedProperties.isTrue
                                          ? controller
                                                  .searchingLeasedPropertyList
                                                  .isEmpty
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
                                                      .searchingLeasedPropertyList
                                                      .length,
                                                  itemBuilder: ((_, index) {
                                                    LeasedProperty property =
                                                        controller
                                                            .searchingLeasedPropertyList
                                                            .elementAt(index);
                                                    return PropertyListItem(
                                                        lease: property);
                                                  }))
                                          : controller.searchingSoldPropertyList
                                                  .isEmpty
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
                                                      .searchingSoldPropertyList
                                                      .length,
                                                  itemBuilder: ((_, index) {
                                                    SoldProperty property =
                                                        controller
                                                            .searchingSoldPropertyList
                                                            .elementAt(index);
                                                    return SoldPropertyItem(
                                                        soldProperty: property);
                                                  }))
                                      : const PropertiesListWidget()
                                ]))),
                    drawer:
                        customDrawer() // This trailing comma makes auto-formatting nicer for build methods.
                    ))));
  }
}
