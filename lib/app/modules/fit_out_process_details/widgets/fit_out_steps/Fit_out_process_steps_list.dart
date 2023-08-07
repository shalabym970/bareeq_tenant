import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../work_permit_details/widgets/work_permit_items/work_permit_item_card.dart';
import 'Fit_out_process_steps_list_item.dart';



class FitOutProcessStepsList extends StatelessWidget {
  const FitOutProcessStepsList({super.key});


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
        return const FitOutStepCard();
      }),

    );
  }
}
