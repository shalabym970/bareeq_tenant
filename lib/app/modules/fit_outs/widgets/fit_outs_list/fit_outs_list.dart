import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'fit_outs_list_item.dart';

class FitOutsList extends StatelessWidget {
  const FitOutsList({super.key});

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
          return const FitOutsListItem();
        }),
      ),
    );
  }
}