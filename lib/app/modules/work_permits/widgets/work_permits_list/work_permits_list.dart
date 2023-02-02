import 'package:Seef/app/modules/dashboard/widgets/recent_work_permits/recent_work_permits_list_item.dart';
import 'package:Seef/app/modules/work_permits/widgets/work_permits_list/work_permits_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkPermitsList extends StatelessWidget {
  const WorkPermitsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: ListView.builder(
        padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
        primary: false,
        shrinkWrap: true,
        itemCount: 20,
        itemBuilder: ((_, index) {
          // var playerStanding =
          // controller.playerStandingList.elementAt(index);
          return const WorkPermitsListItem();
        }),
      ),
    );
  }
}
