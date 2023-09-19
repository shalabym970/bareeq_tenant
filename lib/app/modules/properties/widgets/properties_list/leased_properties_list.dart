import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../common/strings/strings.dart';
import '../../../../../common/widgets/empty_list_widget.dart';
import '../../../../../common/widgets/error_widget.dart';
import '../../../../../common/widgets/vertical_list_loading.dart';
import '../../../../models/leased_property.dart';
import '../../../dashboard/widgets/recent_properties/leases_list_item.dart';
import '../../controllers/properties_controller.dart';

class LeasedPropertiesList extends GetView<PropertiesController> {
  const LeasedPropertiesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Obx(() => controller.loading.isTrue
            ? VerticalListLoading(height: 100.h)
            : controller.error.isTrue
                ? CustomErrorWidget(
                    iconWidth: 20.w, iconHeight: 20.h, fontSize: 15.sp)
                : controller.leasedProperties.isEmpty
                    ? SizedBox(
                        height: 0.5.sh,
                        child: const EmptyListWidget(
                            message: Strings.propertiesEmpty))
                    : ListView.builder(
                        padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
                        primary: false,
                        shrinkWrap: true,
                        itemCount: controller.leasedProperties.length,
                        itemBuilder: ((_, index) {
                          LeasedProperty lease = controller.leasedProperties.elementAt(index);
                          return PropertyListItem(lease: lease);
                        }))));
  }
}
