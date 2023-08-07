import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_message_card.dart';
import '../../../../common/widgets/empty_list_widget.dart';
import '../../../models/work_permit_item.dart';
import '../controllers/work_permit_details_controller.dart';

class WorkPermitsItemsList extends GetView<WorkPermitDetailsController> {
  const WorkPermitsItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: controller.workPermitItems.isEmpty
          ? EmptyListWidget(fontSize: 15.sp, message: Strings.workPermitsEmpty)
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(vertical: 10.h),
              primary: false,
              shrinkWrap: true,
              itemCount: controller.workPermitItems.length,
              itemBuilder: ((_, index) {
                WorkPermitItem workPermitItem =
                    controller.workPermitItems.elementAt(index);
                return CustomMessageItemCard(
                  item: workPermitItem,
                );
              }),
            ),
    );
  }
}
