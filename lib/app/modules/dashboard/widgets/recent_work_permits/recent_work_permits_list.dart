import 'package:Seef/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:Seef/app/modules/dashboard/widgets/recent_work_permits/recent_work_permits_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class RecentWorkPermitsList extends GetView<DashboardController> {
  const RecentWorkPermitsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: ListView.builder(
        padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
        primary: false,
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: ((_, index) {
          // var playerStanding =
          // controller.playerStandingList.elementAt(index);
          return const RecentWorkPermitListItem();
        }),
      ),
    );
  }
}
