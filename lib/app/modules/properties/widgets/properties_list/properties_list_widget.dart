import 'package:bareeq/app/modules/properties/widgets/properties_list/sold_properties_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controllers/properties_controller.dart';
import '../properties_switcher_btn.dart';
import 'leased_properties_list.dart';

class PropertiesListWidget extends GetView<PropertiesController> {
  const PropertiesListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(children: [
              const PropertiesSwitcherBTN(),
              Obx(() => controller.selectLeasedProperties.isTrue
                  ? const LeasedPropertiesList()
                  : const SoldPropertiesList())
            ])));
  }
}
