import 'package:flutter/cupertino.dart';
import 'package:property_pro/app/modules/dashboard/widgets/recent_fit_out_processes/recent_fit_out_processes_list_item.dart';


class RecentFitOutProcessesList extends StatelessWidget {
  const RecentFitOutProcessesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListView.builder(
        padding: const EdgeInsets.only(bottom: 10, top: 10),
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
