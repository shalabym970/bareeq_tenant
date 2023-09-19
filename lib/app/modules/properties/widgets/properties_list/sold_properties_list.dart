import 'package:bareeq/app/models/sold_property.dart';
import 'package:bareeq/app/modules/properties/widgets/properties_list/sold_property_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../common/strings/strings.dart';
import '../../../../../common/widgets/empty_list_widget.dart';
import '../../../../../common/widgets/error_widget.dart';
import '../../../../../common/widgets/vertical_list_loading.dart';
import '../../controllers/properties_controller.dart';

class SoldPropertiesList extends GetView<PropertiesController> {
  const SoldPropertiesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Obx(() => controller.loading.isTrue
            ? VerticalListLoading(height: 100.h)
            : controller.error.isTrue
                ? CustomErrorWidget(
                    iconWidth: 20.w, iconHeight: 20.h, fontSize: 15.sp)
                : controller.soldProperties.isEmpty
                    ? SizedBox(
                        height: 0.5.sh,
                        child: const EmptyListWidget(
                            message: Strings.propertiesEmpty))
                    : ListView.builder(
                        padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
                        primary: false,
                        shrinkWrap: true,
                        itemCount: controller.soldProperties.length,
                        itemBuilder: ((_, index) {
                          SoldProperty soldProperty =
                              controller.soldProperties.elementAt(index);
                          return SoldPropertyItem(soldProperty: soldProperty);
                        }))));
  }
}
