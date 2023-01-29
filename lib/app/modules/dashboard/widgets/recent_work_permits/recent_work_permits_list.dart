import 'package:flutter/cupertino.dart';
import 'package:property_pro/app/modules/dashboard/widgets/recent_work_permits/recent_work_permits_list_item.dart';

class RecentWorkPermitsList extends StatelessWidget {
  const RecentWorkPermitsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListView.builder(
        padding: const EdgeInsets.only(bottom: 10, top: 10),
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
