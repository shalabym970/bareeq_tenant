import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_pro/app/modules/dashboard/widgets/recent_fit_out_processes/recent_fit_out_processes_list_item.dart';


class RecentFitOutProcessesList extends StatelessWidget {
  const RecentFitOutProcessesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 8.h),
      child: ListView.builder(
        padding:  EdgeInsets.only(bottom: 10.h, top: 10.h),
        primary: false,
        shrinkWrap: true,
        itemCount: 2,
        itemBuilder: ((_, index) {
          // var playerStanding =
          // controller.playerStandingList.elementAt(index);
          return const RecentFitOutProcessesListItem();
        }),
      ),
    );
  }
}
