import 'package:Seef/app/models/work_permit_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../work_permit_details/widgets/work_permit_items/work_permit_item_card.dart';
import '../../../models/message.dart';

class FitOutProcessMessagesList extends StatelessWidget {
  const FitOutProcessMessagesList({super.key});


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding:  EdgeInsets.symmetric(vertical: 10.h),
      primary: false,
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: ((_, index) {
        // var playerStanding =
        // controller.playerStandingList.elementAt(index);
        return   WorkPermitItemCard( workPermitItem: WorkPermitItem(),);
      }),

    );
  }
}
